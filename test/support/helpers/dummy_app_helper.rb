module DummyAppHelper
  def app_template_path
    Adminterface::Engine.root.join("test/dummy").to_s
  end

  def tmp_app_path
    "#{tmp_folder_path}/dummy"
  end

  def tmp_folder_path
    Adminterface::Engine.root.join("tmp").to_s
  end

  # `yarn` runs globally at root dir. You will need to use this method
  # to run it in the dummy app if you want to allow running yarn
  def within_dummy
    Dir.chdir(tmp_app_path) { yield }
  end

  def build_app
    clear_tmp_app
    create_tmp_app_dir
    copy_app_template
  end

  def teardown_app
    clear_tmp_app
  end

  def create_tmp_app_dir
    return if Dir.exist?(tmp_folder_path)

    Dir.mkdir(tmp_folder_path)
  end

  def clear_tmp_app
    FileUtils.rm_rf(tmp_app_path)
  end

  def install_activeadmin
    Dir.chdir(tmp_app_path) do
      system "yes | "\
        "rails g active_admin:install "\
        "--skip-users --use_webpacker --force --quiet "\
        ">/dev/null"
    end
  end

  def copy_app_template
    FileUtils.cp_r(app_template_path, tmp_folder_path)
  end
end
