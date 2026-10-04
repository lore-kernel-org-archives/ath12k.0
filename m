Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110EBCA5FE6
	for <ath12k@archiver.kernel.org>; Sun,  4 Oct 2026 18:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nV9jxbP8XUsuuFeVowNXjbkpR1qQV3qviPZvimFlU1Q=; b=KxfOPvJU4V85s1FH6IfeVFq0lB
	R0EvJ8A0LbSzAcg3rf4CMPZSHFgjv+RmHAlzbguhbRfWaY8hDYCIfbBAbUCaGv9gwn1lSibwJl1Ec
	kYeFeT8uITG0YQ3A4MykJ296Ned0lnhYynLTmcYQL0Vs5V6aS50TVcoGITDGN77YFoRFGulGQrUID
	EbeoSIIZiyYn7oc2ONTLp2+yt6CD/YQAfkUaMkpDuoij0Oltn/bDnq/51RK0ccMQHPInMmmHxjhYy
	jqv6TIJTwZXgYbzeD4V2mM69YAkByeAJGXMZHEtL/Ajdw6RaFXrSpItk02M5Bnk4qfA0kDs5ErGrr
	bYpUtncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDRIa-0000000FBcR-0XmQ;
	Sun, 04 Oct 2026 18:51:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDRIW-0000000FBbw-05kI
	for ath12k@lists.infradead.org;
	Sun, 04 Oct 2026 18:50:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHZt72884905
	for <ath12k@lists.infradead.org>; Sun, 4 Oct 2026 18:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nV9jxbP8XUsuuFeVowNXjbkpR1qQV3qviPZvimFlU1Q=; b=l1+0Tcsf9QDVseWX
	4pKNVY1TugU8R7sn5pRerrQmBZHE3DbHhxHOV43MkAVt2JnyH3QjClmCWEmmo+mR
	smTL2YY24PzsskNWPcK3yZHVgmkRcd2qBFuaJzc6CXsyc303GSyA8SEuedt0JT0o
	F0nY1UpAp3prya3Ge1E1chVsWycMdN5KhPMdeKVIxagCCbfN+CZVG317Q6idU5xd
	cLuU2EIcksAWSM5rZ4MD19sR7teFUY5vxmnvnCTB3efjPu9JhqY2qjhl+6aoy5L/
	bdZfqZHi6QOP+PXGMp8g5CiTtLKw7MTC/rmDuNFChvVqxrdLASDVFqJdYDKKkquP
	IPc3dQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfhge7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 04 Oct 2026 18:50:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so1698150eec.0
        for <ath12k@lists.infradead.org>; Sun, 04 Oct 2026 11:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791139854; x=1791744654; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nV9jxbP8XUsuuFeVowNXjbkpR1qQV3qviPZvimFlU1Q=;
        b=F0n+uQkqEgpx3Bb/LhztudfkTLNYx4xfAimyt5NgvNgXrUCoIVFfmVt4/0RYJPlVnv
         dujj2eD/kmUS8by6JZLIsYxpq5t5JqsjoOg75GjohLDiqH3dgL5S2pIo9oD4mu8i2GVb
         iCTmHIBjh/FgbjNcvYFonzBbWYfpfLFwm/34yg9Kb5HKbw8JveC5OFiBs5xl3BBquwaB
         5i+EwNn7dNJqGUw6RdWd10U20YbjmeXw8IDINH+jvk1Sx++bRgUzxcDMk6qOQDVUoxS0
         dele+LHt4qZgNuIEA7qpRqw+qTtdxOLaYpqLRvM8BSbcm2TIdk0FNAHq2wm3KvDTjtrg
         Y2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139854; x=1791744654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nV9jxbP8XUsuuFeVowNXjbkpR1qQV3qviPZvimFlU1Q=;
        b=STcf4kiF32oDKOxD3BXgU6u28GCVtrJklKHWzFyPTNPHgZteKLaD5fVFTeXD+J8yVY
         7JS6o1YmY0y++WkzoL++RAhvpAfICBUw/CWFjtS8N89n+3cxSQnKNYKu5wfoVtrwVmeB
         dd9MqEs0pbG76fgoqPXzpiTEQQEDUBL4RZhx/X7HRhgheCErUt/bc7Q9eLUy6TnqEJL6
         ME529zCxi7aRJNqZER2j/bv1UEdwpEFqRUAhHFgM/rBZ8Qgg/BtqXSTVHdodqzvPCE8O
         Be604LJa4TYs855cZgF5wWRobaEE0z2UUpbh14T61ODs3S7zuvE63/nEr05NBjIvVUYG
         RMlg==
X-Forwarded-Encrypted: i=1; AKwUvBxOfWdtNpqYsCd+MRphOOP2P5xSEJTJGySfUl/fE4+wu0qLoYiPJWslyiY8UUZuF0UA0Qgxx3g=@lists.infradead.org
X-Gm-Message-State: AFuF++mpGjV+D3VyLxztFs5h9/Zj1c25DrVdHqJ5J6sdTAJ2ABou1LwZ
	mszs2Tr9VBKvHPmMhFJJ2ia7Az2MSDwGRLnO4/JwyPB4d038wWm8HFcaTU7nwX3f/NR/LVnj4GC
	/LKJ8bzO1Pnl0L1NrzAdselucKaRPBhnVHGExj3P5j8LDoWBmwvA28/UlK8XGQz/k
X-Gm-Gg: AYBFou1OpHiY1z8jPyvbkIonw7xvSwQ9F2WZG8/JweORHuyRNU4ga60GO3s8d31Tfuf
	CpdZwQdvUCZ4v3r+F+hls3XnArbPmdL2W25MSPu/zO4LvcJWfXIm+ncxwGMnYe1lzZK939avpR8
	c6JeL73kjtcvKw8lvKjJuf+MyMMNrhr29xCkHQlzlDG+rAOjrwJTGT33V5JusUrg4CufjycZvb8
	BCneuF+C8g2DpGMGGG6bALSyS7lFJXAEoYEwztboB7QXCMBx3ENEA3diBgeSQaiEMVaxQJKEwwh
	Kz2dsKLrLfQr9iLWH9kkZOjF/COvwG3wjPB+PNaFbm7Beg6WDqGEDTinI7otq72iS83FQCTeLWB
	geKo039jAfqiVQ0BRO7Id+Qi9O5Xtdr6hntK3f0SEOHXCLHiY6nST1LnaZA==
X-Received: by 2002:a05:693c:87d1:20b0:34c:1bc7:bcb with SMTP id 5a478bee46e88-34f159887a3mr10541819eec.22.1791139853640;
        Sun, 04 Oct 2026 11:50:53 -0700 (PDT)
X-Received: by 2002:a05:693c:87d1:20b0:34c:1bc7:bcb with SMTP id 5a478bee46e88-34f159887a3mr10541790eec.22.1791139852885;
        Sun, 04 Oct 2026 11:50:52 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35126f01924sm6849806eec.0.2026.10.04.11.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 11:50:52 -0700 (PDT)
Message-ID: <93d5fc5e-8174-40ea-9fb0-7beca2f37aa9@oss.qualcomm.com>
Date: Sun, 4 Oct 2026 11:50:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 ath-next] wifi: ath12k: Add EHT capabilities to scan
 probe frame
To: Gaole Zhang <gaole.zhang@oss.qualcomm.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: gaolez@qti.qualcomm.com, miaoqing.pan@oss.qualcomm.com,
        hangtian.zhu@oss.qualcomm.com
References: <20261001083940.3051840-1-gaole.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261001083940.3051840-1-gaole.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -U8eoLYAvTT4vlZYF2_2qb-7Dvm4xbEk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA3NSBTYWx0ZWRfXxO11lXdAc0Us
 f+g7+AhGQJM141HSCJjwg2slH4kKAOkLAikaaja2wTsbZ/PCBEfpSDHwUArsfLWRzsH2LjtFdvk
 oBm3ySCSXT6l0by54MXUTzDHi7+d6Ms=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac2a00e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zJyiC_DEuhvTwcvo-FgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: -U8eoLYAvTT4vlZYF2_2qb-7Dvm4xbEk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA3NSBTYWx0ZWRfXyaucfp6pPGW1
 VsljP/gCvKumUrcQIx2fNgjoUYABZpYEbKTlNS6Tx+OqtJJYtH63SgZeEJ6U2GOH5YBhUiUe9vt
 vZORU2qsmHsqIvd5qqry3WhxdZF7V/hbLf31qIzKC9B+FidLWcf00qrWTkeCa/SnDOoKco0bPPq
 l6ZgqKV9nTEyCnHOET5dBL2zTAOuwvoCDqahQz/az8yqULtuox8DYoTCHtRGS+5FqCw/vDbVk8Y
 Q/yOT7DmLM+vWs/3TXAsRYDXznmih++E1cK6AL+YoWPjffJXGzhnb/mahHZ8qm3Darq2yZyQFH0
 eY3NDf3GPlxx9QpRWRBYGPE8yCNIBBuo7uDe1H9TeG1TDWkMImVSgYetkUU896ocEe1l7jKAA8q
 XCy6++wRyiqeaW7YOExhH58Q8x49ycz9zC2PuyxjTp05bM5oufMaeAa4QICC4LPeTeYQZZg5o2L
 Aj3oxD4k7Mu4LIe2vZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610040075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_115057_588966_A8AE7D94 
X-CRM114-Status: GOOD (  30.99  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/1/2026 1:39 AM, Gaole Zhang wrote:
> ath12k hardware scan Probe Request frames do not include the EHT
> Capabilities element. Without this element, an AP cannot identify the
> STA as EHT-capable during active scanning and may omit EHT-related
> information from its Probe Response. This can result in incomplete scan
> information and prevent userspace from correctly determining the AP's
> EHT capabilities.
> 
> For firmware to include the EHT Capabilities element in scan Probe
> Request frames, two conditions are required:
> 
>   - The scan channel must have WMI_CHAN_INFO_ALLOW_EHT set, which allows
>     firmware to add the EHT Capabilities element to Probe Request frames.
>   - The EHT Capabilities element must be configured on the vdev through
>     WMI_VDEV_SET_IE_CMDID, so firmware can use it when building Probe
>     Request frames.
> 
> Set WMI_CHAN_INFO_ALLOW_EHT for channels when 11be is supported by
> firmware and not disabled by ACPI. Also configure the EHT Capabilities
> element before each hardware scan when the element is present in the
> mac80211 scan IE buffer.
> 
> Firmware retains the configured element in the vdev context until it is
> replaced or the vdev is deleted. However, ath12k scans may either reuse
> an already started vdev or create a temporary scan vdev that is cleaned
> up after scan completion. Sending WMI_VDEV_SET_IE_CMDID for each scan
> request ensures correct behavior in both cases.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
> ---
> v2:
>  - Clarify the firmware requirements for adding the EHT Capabilities
>    element to scan Probe Request frames.
>  - Explain why the EHT Capabilities element is configured before each
>    hardware scan, covering both reused vdevs and temporary scan vdevs.
>  - No code changes.
> 
>  drivers/net/wireless/ath/ath12k/core.h |  6 ++++
>  drivers/net/wireless/ath/ath12k/mac.c  | 29 +++++++++++++--
>  drivers/net/wireless/ath/ath12k/reg.c  |  4 +++
>  drivers/net/wireless/ath/ath12k/wmi.c  | 50 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h  | 23 +++++++++++-
>  5 files changed, 109 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index a98fc6e0699d..e7373a523dc3 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1394,6 +1394,12 @@ static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 radio_idx)
>  	return &ah->radio[radio_idx];
>  }
>  
> +static inline bool ath12k_is_11be_enabled(struct ath12k_base *ab)
> +{
> +	return test_bit(WMI_TLV_SERVICE_11BE, ab->wmi_ab.svc_map) &&
> +	       !ath12k_acpi_get_disable_11be(ab);
> +}
> +
>  static inline struct ath12k_hw *ath12k_ar_to_ah(struct ath12k *ar)
>  {
>  	return ar->ah;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d4116ba0da08..f353af63c5eb 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5602,6 +5602,25 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
>  	return ATH12K_FIRST_SCAN_LINK;
>  }
>  
> +static int ath12k_mac_set_scan_eht_cap_ie(struct ath12k *ar,
> +					  struct ath12k_link_vif *arvif,
> +					  const u8 *ies, size_t ies_len)
> +{
> +	const struct element *eht_cap;
> +
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> +
> +	eht_cap = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_CAPABILITY, ies,
> +					 ies_len);
> +	if (!eht_cap || eht_cap->datalen <= 1)
> +		return 0;
> +
> +	return ath12k_wmi_vdev_set_ie(ar, arvif->vdev_id,
> +				      WLAN_EID_EXTENSION,
> +				      eht_cap->data, eht_cap->datalen,
> +				      WMI_SET_VDEV_IE_BAND_ALL);
> +}
> +
>  static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>  				       struct ieee80211_vif *vif,
>  				       struct ieee80211_scan_request *hw_req,
> @@ -5718,6 +5737,13 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>  			goto exit;
>  		}
>  		arg->extraie.len = req->ie_len;
> +		ret = ath12k_mac_set_scan_eht_cap_ie(ar, arvif, req->ie,
> +						     req->ie_len);
> +		if (ret) {
> +			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
> +				   "failed to set eht cap ie, ret %d\n", ret);
> +			goto exit;

do we really want to bypass scanning in this case?
would it be better to still scan, just without added capability?

> +		}
>  	}
>  
>  	if (req->n_ssids) {
> @@ -8983,8 +9009,7 @@ static void ath12k_mac_copy_eht_cap(struct ath12k *ar,
>  
>  	memset(eht_cap, 0, sizeof(struct ieee80211_sta_eht_cap));
>  
> -	if (!(test_bit(WMI_TLV_SERVICE_11BE, ar->ab->wmi_ab.svc_map)) ||
> -	    ath12k_acpi_get_disable_11be(ar->ab))
> +	if (!ath12k_is_11be_enabled(ar->ab))
>  		return;
>  
>  	eht_cap->has_eht = true;
> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
> index 89abf2e87ad1..0aba1e74a3e9 100644
> --- a/drivers/net/wireless/ath/ath12k/reg.c
> +++ b/drivers/net/wireless/ath/ath12k/reg.c
> @@ -140,6 +140,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>  	enum nl80211_band band;
>  	int num_channels = 0;
>  	int i, ret = 0;
> +	bool has_eht;
>  
>  	if (ar->ah->state == ATH12K_HW_STATE_RESTARTING)
>  		return 0;
> @@ -180,6 +181,8 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>  
>  	ch = arg->channel;
>  
> +	has_eht = ath12k_is_11be_enabled(ar->ab);
> +
>  	for (band = 0; band < NUM_NL80211_BANDS; band++) {
>  		if (!(ar->mac.sbands[band].channels && bands[band]))
>  			continue;
> @@ -201,6 +204,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>  			ch->allow_ht = true;
>  			ch->allow_vht = true;
>  			ch->allow_he = true;
> +			ch->allow_eht = has_eht;
>  
>  			ch->dfs_set =
>  				!!(channel->flags & IEEE80211_CHAN_RADAR);
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index a63bbda0219c..5fe7af731a4e 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2005,6 +2005,54 @@ int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
>  	return ret;
>  }
>  
> +int ath12k_wmi_vdev_set_ie(struct ath12k *ar, u32 vdev_id, u32 ie_id,
> +			   const u8 *ie, size_t ie_len, u32 band)
> +{
> +	struct ath12k_wmi_pdev *wmi = ar->wmi;
> +	struct wmi_vdev_set_ie_cmd *cmd;
> +	struct sk_buff *skb;
> +	struct wmi_tlv *tlv;
> +	size_t aligned_len;
> +	int ret, len;
> +	void *ptr;
> +
> +	aligned_len = roundup(ie_len, sizeof(u32));
> +	len = sizeof(*cmd) + TLV_HDR_SIZE + aligned_len;
> +
> +	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	ptr = skb->data;
> +	cmd = ptr;
> +	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_VDEV_SET_IE_CMD,
> +						 sizeof(*cmd));
> +	cmd->vdev_id = cpu_to_le32(vdev_id);
> +	cmd->ie_id = cpu_to_le32(ie_id);
> +	cmd->ie_len = cpu_to_le32(ie_len);
> +	cmd->ie_source = cpu_to_le32(WMI_SET_VDEV_IE_SOURCE_HOST);
> +	cmd->band = cpu_to_le32(band);
> +
> +	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
> +		   "WMI set ie vdev_id %u ie_id %u ie_len %zu band %u\n",
> +		   vdev_id, ie_id, ie_len, band);
> +
> +	ptr += sizeof(*cmd);
> +	tlv = ptr;
> +	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, aligned_len);
> +	memcpy(tlv->value, ie, ie_len);
> +
> +	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_VDEV_SET_IE_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab,
> +			    "failed to send WMI_VDEV_SET_IE_CMDID for vdev %u ie %u: %d\n",
> +			    vdev_id, ie_id, ret);
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
> +}
> +
>  int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
>  			struct ieee80211_mutable_offsets *offs,
>  			struct sk_buff *bcn,
> @@ -2946,6 +2994,8 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k *ar,
>  				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_VHT);
>  			else if (channel_arg->allow_ht)
>  				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_HT);
> +			if (channel_arg->allow_eht)
> +				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_EHT);
>  			if (channel_arg->half_rate)
>  				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_HALF_RATE);
>  			if (channel_arg->quarter_rate)
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index b508aa759bd8..e51b3bdab77b 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -3075,7 +3075,8 @@ struct ath12k_wmi_channel_arg {
>  	    allow_vht:1,
>  	    allow_he:1,
>  	    set_agile:1,
> -	    psc_channel:1;
> +	    psc_channel:1,
> +	    allow_eht:1;

add after allow_he to keep in a logical order since this isn't ABI?

>  	u32 phy_mode;
>  	u32 cfreq1;
>  	u32 cfreq2;
> @@ -3694,6 +3695,7 @@ struct ath12k_wmi_scan_cancel_arg {
>  #define WMI_CHAN_INFO_DFS_FREQ2		BIT(16)
>  #define WMI_CHAN_INFO_ALLOW_HE		BIT(17)
>  #define WMI_CHAN_INFO_PSC		BIT(18)
> +#define WMI_CHAN_INFO_ALLOW_EHT		BIT(21)
>  
>  #define WMI_CHAN_REG_INFO1_MIN_PWR	GENMASK(7, 0)
>  #define WMI_CHAN_REG_INFO1_MAX_PWR	GENMASK(15, 8)
> @@ -3845,6 +3847,23 @@ struct wmi_p2p_go_set_beacon_ie_cmd {
>  	__le32 ie_buf_len;
>  } __packed;
>  
> +#define WMI_SET_VDEV_IE_SOURCE_HOST	0
> +
> +enum wmi_set_vdev_ie_band {
> +	WMI_SET_VDEV_IE_BAND_ALL,
> +	WMI_SET_VDEV_IE_BAND_2_4GHZ,
> +	WMI_SET_VDEV_IE_BAND_5GHZ,
> +};
> +
> +struct wmi_vdev_set_ie_cmd {
> +	__le32 tlv_header;
> +	__le32 vdev_id;
> +	__le32 ie_id;
> +	__le32 ie_len;
> +	__le32 ie_source;
> +	__le32 band;
> +} __packed;
> +
>  struct wmi_vdev_install_key_cmd {
>  	__le32 tlv_header;
>  	__le32 vdev_id;
> @@ -6583,6 +6602,8 @@ int ath12k_wmi_pdev_resume(struct ath12k *ar, u32 pdev_id);
>  
>  int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>  				   struct ath12k_wmi_peer_assoc_arg *arg);
> +int ath12k_wmi_vdev_set_ie(struct ath12k *ar, u32 vdev_id, u32 ie_id,
> +			   const u8 *ie, size_t ie_len, u32 band);
>  int ath12k_wmi_vdev_install_key(struct ath12k *ar,
>  				struct wmi_vdev_install_key_arg *arg);
>  int ath12k_wmi_pdev_bss_chan_info_request(struct ath12k *ar,
> 
> base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c


