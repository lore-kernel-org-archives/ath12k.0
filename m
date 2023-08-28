Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE5C71153
	for <ath12k@archiver.kernel.org>; Mon, 28 Aug 2023 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgzM68zCHeqKbPNxQMCwhQTuD9TqteuW2mmcpko1Nj8=; b=UGxdsTw+yBBScV
	8Zyt2kv3I0fWERtvWBGQdsFJDJzsMZzvaIKWG5naDW/FnrrDQ4m3x0Nzf7FnYis7AbRwomw2t2Edt
	t+G55aCkx/fz8KvaG7ebyBGlrdDuxBRw9elOmDfJiPsYK6mCoR1PdhQ9RDKHh6zNYFMWYFzpwcORP
	7sgKSySeTWs7vVg5xF9b/wIojolCTeYNFDbdQG10KtBCO9eME8SKAVz/2eQM1MoLv6n/1Ky0/66DQ
	9UOnSa10H5a+LhSUyc1FuEGxTay0oo4MmSOe+Cy2kM4JvJnxFJ4OgYzcEhVhvDxZW4vmUGr7KxLG4
	I5V7ism2fsSJDRa604DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qadWZ-009jfW-0M
	for ath12k@archiver.kernel.org;
	Mon, 28 Aug 2023 14:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qadWX-009jeg-09
	for ath12k@lists.infradead.org;
	Mon, 28 Aug 2023 14:47:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37SB6ROK011221;
	Mon, 28 Aug 2023 14:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LtEJ+DfcSuwg7tQh+ZeetnkwhEqUUalCmlNBAxHeNOA=;
 b=lsxr3gmI/tQQB3ozrD1aTbSuhbCGATZl1ha08SdYZhluOuK0eLNjrShXjS+1a7fDE1uM
 nMbzC/XEEDoua5zs5PYJ5N7skBLtyjtcr/FuaLeTHwA1MxbCGtqHr2cuk2xc8SjURvm+
 KChHcru7rY0wYCQNXUn353JCI4f5epIPB8gz2awCWutYgxhWLzcQesnBXRp2hAgKEhTu
 Pbx4x6RL39RS+9MV7uQqraL5cevtNloMLthQj6WN0IKW2suSL3hPNa+w3WWFaUs99JhH
 +ocAos+vrcTOs01W+I6/n5pxHGWn5GFYGx1J0bnpJmQmFZ4L5JvrLnRI3zvl82MniUri 5w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sqapfktta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 14:47:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37SElMS4008074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 14:47:22 GMT
Received: from [10.48.245.159] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 28 Aug
 2023 07:47:21 -0700
Message-ID: <dd1b11ee-696e-46f2-ad53-b80f4d0d9256@quicinc.com>
Date: Mon, 28 Aug 2023 07:47:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band
 in EHT PHY capability for WCN7850
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230828040420.2165-1-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230828040420.2165-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: svM0Z4S_HjJjFoJCj0yDiWJ8exzf0Uc_
X-Proofpoint-GUID: svM0Z4S_HjJjFoJCj0yDiWJ8exzf0Uc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_12,2023-08-28_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_074725_093281_EAE29B90 
X-CRM114-Status: GOOD (  22.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/27/2023 9:04 PM, Wen Gong wrote:
> 320 MHz bandwidth is reported only for single PHY mode for WCN7850, get it
> from WMI_HOST_HW_MODE_SINGLE ath12k_wmi_caps_ext_params and report it for
> 6 GHz band.
> 
> After this patch, "iw list" show 320MHz support for WCN7850:

nit: s/320MHz/320 MHz/ to conform to SI

> EHT Iftypes: managed
>          EHT PHY Capabilities: (0xe26f090010768800):
>                  320MHz in 6GHz Supported

unfortunate that 'iw' doesn't conform to SI representation

>          EHT bw=320 MHz, max NSS for MCS 8-9: Rx=0, Tx=0
>          EHT bw=320 MHz, max NSS for MCS 10-11: Rx=0, Tx=0
>          EHT bw=320 MHz, max NSS for MCS 12-13: Rx=0, Tx=0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
> v3:
>     1. fix "wmi.c:4199:69: warning: restricted __le32 degrades to integer"
>     2. s/capbility/capability/
>     3. change "u8 support_320mhz" to "u32 support_320mhz"
> 
> v2: change eht_cap_phy_info_5G to eht_cap_phy_info_5ghz.
> 
>   drivers/net/wireless/ath/ath12k/wmi.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 9ed33e2d6da0..5f46259cfa2a 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -4148,14 +4148,22 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
>   				       __le32 cap_info_internal)
>   {
>   	struct ath12k_band_cap *cap_band = &pdev->cap.band[band];
> +	u32 support_320mhz;
>   	u8 i;
>   
> +	if (band == NL80211_BAND_6GHZ)
> +		support_320mhz = cap_band->eht_cap_phy_info[0] &
> +					IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
> +
>   	for (i = 0; i < WMI_MAX_EHTCAP_MAC_SIZE; i++)
>   		cap_band->eht_cap_mac_info[i] = le32_to_cpu(cap_mac_info[i]);
>   
>   	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
>   		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
>   
> +	if (band == NL80211_BAND_6GHZ)
> +		cap_band->eht_cap_phy_info[0] |= support_320mhz;
> +
>   	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
>   	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);
>   	if (band != NL80211_BAND_2GHZ) {
> @@ -4177,10 +4185,19 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
>   				      const struct ath12k_wmi_caps_ext_params *caps,
>   				      struct ath12k_pdev *pdev)
>   {
> -	u32 bands;
> +	struct ath12k_band_cap *cap_band;
> +	u32 bands, support_320mhz;
>   	int i;
>   
>   	if (ab->hw_params->single_pdev_only) {
> +		if (caps->hw_mode_id == WMI_HOST_HW_MODE_SINGLE) {
> +			support_320mhz = le32_to_cpu(caps->eht_cap_phy_info_5ghz[0]) &
> +				IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
> +			cap_band = &pdev->cap.band[NL80211_BAND_6GHZ];
> +			cap_band->eht_cap_phy_info[0] |= support_320mhz;
> +			return 0;
> +		}
> +
>   		for (i = 0; i < ab->fw_pdev_count; i++) {
>   			struct ath12k_fw_pdev *fw_pdev = &ab->fw_pdev[i];
>   
> @@ -4236,7 +4253,8 @@ static int ath12k_wmi_tlv_mac_phy_caps_ext(struct ath12k_base *ab, u16 tag,
>   		return -EPROTO;
>   
>   	if (ab->hw_params->single_pdev_only) {
> -		if (ab->wmi_ab.preferred_hw_mode != le32_to_cpu(caps->hw_mode_id))
> +		if (ab->wmi_ab.preferred_hw_mode != le32_to_cpu(caps->hw_mode_id) &&
> +		    caps->hw_mode_id != WMI_HOST_HW_MODE_SINGLE)
>   			return 0;
>   	} else {
>   		for (i = 0; i < ab->num_radios; i++) {
> 
> base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
