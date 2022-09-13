Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4D2C54EE9
	for <ath12k@archiver.kernel.org>; Tue, 13 Sep 2022 06:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OK/0D02pOMCYAMse2F3xdTmiRCQyxBsGdcVK9bkcFJs=; b=scICTQ/e7Bcy2O
	u2+hy66uezvjw0XCw5dyOjKKpA+QKKehGtnD9FVCFfTPNMFPDDqqIfHqWtUrpKkIhLriW9Bch+mKE
	7ExEVbSPK7r0hByrpV/oXPBT0D2vSV7TzcU/g9+BkpdN7js/OT6cQ+UcIIy32aDglBQeiKIEhYUIU
	rAGDB/+sppRGJpHylJYEa/+wbjKqJrMttoixCoF98andadJfceg+47p4om+jdfXADCbZYacLC2Bbz
	rrDyGI+UPULdlR4xwPkxQT/75hDtikXS4fq9ogH9JK9aBHtMs7TtybsrXk7epC59OkAUQ+2eulKnR
	i2jXPgSQ6jEf9FqKojSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFZ-002sNz-B0
	for ath12k@archiver.kernel.org; Tue, 13 Sep 2022 06:18:25 +0000
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFV-002sIA-VG
	for ath12k@lists.infradead.org; Tue, 13 Sep 2022 06:18:24 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 28D6HfP52022783, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 28D6HfP52022783
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Tue, 13 Sep 2022 14:17:41 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 13 Sep 2022 14:18:01 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 14:18:01 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::402d:f52e:eaf0:28a2]) by
 RTEXMBS04.realtek.com.tw ([fe80::402d:f52e:eaf0:28a2%5]) with mapi id
 15.01.2375.007; Tue, 13 Sep 2022 14:18:01 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kalle Valo <kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 05/50] wifi: ath12k: add core.c
Thread-Topic: [PATCH 05/50] wifi: ath12k: add core.c
Thread-Index: AQHYrmbDa4/duu9Vu02ljYPQ7r8adK3dEfhw
Date: Tue, 13 Sep 2022 06:18:01 +0000
Message-ID: <6cce0974d5bb40c2a2a40b4abeb41e74@realtek.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-6-kvalo@kernel.org>
In-Reply-To: <20220812161003.27279-6-kvalo@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/9/13_=3F=3F_02:24:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_231822_206998_DFD82855 
X-CRM114-Status: GOOD (  18.66  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


> -----Original Message-----
> From: Kalle Valo <kvalo@kernel.org>
> Sent: Saturday, August 13, 2022 12:09 AM
> To: linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: [PATCH 05/50] wifi: ath12k: add core.c
> 
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 937 +++++++++++++++++++++++++++++++++
>  1 file changed, 937 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> new file mode 100644
> index 000000000000..476c5ba55fb2
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -0,0 +1,937 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */

[...]

> +
> +static int ath12k_core_start(struct ath12k_base *ab,
> +			     enum ath12k_firmware_mode mode)
> +{
> +	int ret;
> +
> +	ret = ath12k_wmi_attach(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to attach wmi: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = ath12k_htc_init(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to init htc: %d\n", ret);
> +		goto err_wmi_detach;
> +	}
> +
> +	ret = ath12k_hif_start(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to start HIF: %d\n", ret);
> +		goto err_wmi_detach;
> +	}
> +
> +	ret = ath12k_htc_wait_target(&ab->htc);
> +	if (ret) {
> +		ath12k_err(ab, "failed to connect to HTC: %d\n", ret);
> +		goto err_hif_stop;
> +	}
> +
> +	ret = ath12k_dp_htt_connect(&ab->dp);
> +	if (ret) {
> +		ath12k_err(ab, "failed to connect to HTT: %d\n", ret);
> +		goto err_hif_stop;
> +	}
> +
> +	ret = ath12k_wmi_connect(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to connect wmi: %d\n", ret);
> +		goto err_hif_stop;
> +	}
> +
> +	ret = ath12k_htc_start(&ab->htc);
> +	if (ret) {
> +		ath12k_err(ab, "failed to start HTC: %d\n", ret);
> +		goto err_hif_stop;
> +	}
> +
> +	ret = ath12k_wmi_wait_for_service_ready(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to receive wmi service ready event: %d\n",
> +			   ret);
> +		goto err_hif_stop;
> +	}
> +
> +	ret = ath12k_mac_allocate(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to create new hw device with mac80211 :%d\n",
> +			   ret);
> +		goto err_hif_stop;
> +	}
> +
> +	ath12k_dp_cc_config(ab);
> +
> +	ath12k_dp_pdev_pre_alloc(ab);
> +
> +	ret = ath12k_dp_rx_pdev_reo_setup(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to initialize reo destination rings: %d\n", ret);
> +		goto err_mac_destroy;
> +	}
> +
> +	ret = ath12k_wmi_cmd_init(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to send wmi init cmd: %d\n", ret);
> +		goto err_reo_cleanup;
> +	}
> +
> +	ret = ath12k_wmi_wait_for_unified_ready(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to receive wmi unified ready event: %d\n",
> +			   ret);
> +		goto err_reo_cleanup;
> +	}
> +
> +	/* put hardware to DBS mode */
> +	if (ab->hw_params->single_pdev_only) {
> +		ret = ath12k_wmi_set_hw_mode(ab, WMI_HOST_HW_MODE_DBS);
> +		if (ret) {
> +			ath12k_err(ab, "failed to send dbs mode: %d\n", ret);
> +			goto err_hif_stop;

Should it goto err_reo_cleanup?

> +		}
> +	}
> +
> +	ret = ath12k_dp_tx_htt_h2t_ver_req_msg(ab);
> +	if (ret) {
> +		ath12k_err(ab, "failed to send htt version request message: %d\n",
> +			   ret);
> +		goto err_reo_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_reo_cleanup:
> +	ath12k_dp_rx_pdev_reo_cleanup(ab);
> +err_mac_destroy:
> +	ath12k_mac_destroy(ab);
> +err_hif_stop:
> +	ath12k_hif_stop(ab);
> +err_wmi_detach:
> +	ath12k_wmi_detach(ab);
> +	return ret;
> +}
> +

[...]

> +
> +MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11be wireless LAN cards.");
> +MODULE_LICENSE("Dual BSD/GPL");

// SPDX-License-Identifier: BSD-3-Clause-Clear

Out of curiosity, SPDX license and MODULE_LICENSE() are different. 
Could I know the rules?

Ping-Ke


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
