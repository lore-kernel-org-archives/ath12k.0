Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CABF606A68F
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 21:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RVedf1B6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACr7VcTZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XAWd7KzS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=; b=RVedf1B6NCV+cY
	IpDedOlsbJBIVGoM2xJcfKV2kqGEXCGIw5TJwsqA4EZqzvCvEgqLKmdHDIeQi3Qq+6VlAez4AscKZ
	ycZ1sqo+c2nzB6LJCLYt9cbkt1U4uP+/hyOavBkgs8zCBGzrXhmc5AWy5pqN00fBAy+2/yOI9Q1VO
	HIpmGv+WgrSDBanIxy3YZnPXw0Toq+RKNQCbpz8SaUrLCkNxslp8a9nNlSaoMlttpRNEm5j5a51m8
	dGbzY1IzQo+NejcRKZ9TdkxSndZsM2f8/BnJvlWhLcynSP75wEKWUDvZzEQ8+yAzp4F9sOIPbpt7f
	xylC65V81MfpR0BE09Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxvd-00000007qrG-1OBa;
	Tue, 24 Nov 2026 21:19:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxva-00000007qqv-2JEW
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 21:19:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJKWPE2855019
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 21:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=; b=ACr7VcTZT7KgMvkb
	f/riEMLagAVttUZbXJQup8HmnwrVymJIAFwa1DlqcPXhoe5vnTScPac8m4AKp6MG
	Wwo71pqbg2nr8WOm78tevSJMr9hh/gKJYpT/n55WKYDlgEr8D+2xA4zLt1qoDxwh
	j9wMpBH1fzo0O8XkldvjDMaYMKMtuikJBYz4I8Rs5z4EfSEjAqy5184Qi5NxMgG2
	T2FAQohhcUxLTvN3iD1vewKWOUOlPu6QySCGEB8mSWitYMNTdm1BC3j5yEmDPUUV
	8Zci2JF67xUD7Hl6KEmywPb3nvRfchAhnlWlibk/yqpWPRNbk0071XbvXU2VFKzZ
	E2BrCQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnf8d9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 21:19:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a0f79047so5120452eec.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795555188; x=1796159988; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=;
        b=XAWd7KzSmqA4KmGrOwGb/AGw1uFR6QgZiNmy03qcRzvzV1tus/O1W61FYx+J5TClqy
         A+k9cZey1kPXesYHGPgnhxmQVMqD1Q30pPmjFN3svv+C2B+nQRvn8ZZlXWuafkC2p7SK
         ttAjjjFNjIEhNoaF0wgCvIbxHQ//0pIWFkoTJMKYDROQcgokIPlp9dVoeXORFUVXM/k0
         2UMPCfha5CygVYtRM7RD76VTRVQkqPyUDrjNCc+PuhhLCpT2seN8Uslq/D+ETotxHlp6
         fkR3WrMdKEzkqlcv42d+n5RHcdWsf9x1l4vclwU8y3WEzzgYk1p0bTgNnYZPi55FClNE
         OpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555188; x=1796159988;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=;
        b=zzoFvD+HeOCr6cOmNTWtbe0m9bxof1aPFnO5XwpDvsV+VkLFyBEofKafV5HMPKCRqd
         /XiuubvYh2owsAXq5tE642cOQGzqt44DfGydKTyXPI4WOeHCQhEoapg1tGTGidqBSqI7
         LmpLh5sF0ypCimsXoTfJSnQAOz4j4wydhNtI/ThDwv7OVhpaNLfgd3zwwSysVnk3HqvW
         vJxZ2NPOCo+ffbDWIhcOuwaMW/TrSQkeLgR5fAQZozrbdoZDgtbKRqsJALKBZ1awjCx0
         DpR439gsQYNVkR7ZSsHbUapccQxgphnlY69KkbPn+sP3MX55cMq9v1kwAsel9HBuvkLd
         KzfQ==
X-Gm-Message-State: APuU4Z9QG6gw3qhiQDDGwXjDHU/r92KKzVx2u+6papwx5J0wCquVZzaI
	UNVKyl8h7/veJpcxoe6a5dr5Aik/pCzHVOH2gJ2IM5mf/bs6PT6Pd7T2Xfp0CHhk19f2b1qPai0
	dSNggb9dbzWbp3u4VR6erX65G7pAb3hiDczops+5L50HVniL5wqXi3IkBdulqz10l
X-Gm-Gg: AZFdTZdZwtKfUf/V4jYUTmniZo6FaedEeEe5vmmAJxHdpbrzTuYwgzo3Llm9gFtaR2T
	6pp39OC/DBFHjl9OQvPem/Dvxo/ynJOKy+WErbO4Axcosxiq03XYGZJWE1At//yCM2zBTXP9H0A
	fXjJ3JY+TNLIPm+mf0WDnp+Nbr6ts8e7gNlJNOoZHhnCioV8KoNMoK+sUua2P876AyhSIDsnvJ/
	mMge5J+7nslSeKLBwUDz+wMC3WB7B74uiRAZ56acRLLjiJAwGpakxou9MaPup8KJLlhvY3gHTPE
	4uvf+QdakMxKBRlp3f0RMjLamPFqVZFwi50ndW+NO2dmY285yFpQbhMpggoXhi8oz9yOMx67/ES
	iTt/98rYfz05u0haxAvlMkDxZ+auuxdzBdSLmV3zsGSxI/JRRaLn9nuLucUcCErn2CvVKjae26/
	8KCTawu3jEoYhfS/3W
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr12711153eec.17.1795555188368;
        Tue, 24 Nov 2026 13:19:48 -0800 (PST)
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr12711127eec.17.1795555187818;
        Tue, 24 Nov 2026 13:19:47 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm14506896eec.9.2026.11.24.13.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 13:19:47 -0800 (PST)
Message-ID: <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 02:49:43 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/7] wifi: ath12k: fix
 ath12k_mac_op_change_vif_links() for active-link updates
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfXwCkAgTIHVH5x
 +NKavI4aa5cTyrca8pQaYnVkOCWPI9ytJghFgTiLyETEd1/3r+dDjeai4FPfmlItFxnjE49PszS
 MHbJ6g4sy1Y0xPJeAAjMZaYzDDFJLqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfXydNxrOucYHDJ
 F6y+5Ye29CUT1QTJbZTXHGVdCLQ92n+k4vt9IQv5eJ/EMdQlH4LNp/+f8CalYT/5AanMMQqAQna
 YMr9sa56/E/Ws9Q44drSwpzARxA0r7WsAdkohaHpW2qA3UrLQlDtMJhUPASj/tw1PpzrV/o/p5F
 pb67/8P8pmfAiOvLvT2LVEfJi8yMcBeEwYM2dp62+3nqPXpU3qZAi9Ud1mZEr5CYQ4VOqa1sy/x
 VZ6je8uG42y5fGrsN1tLIavtMM2EYKQLIlabXaPwaAw1MOxiYLsrsScngA0uFbEviXJvpa1FFnb
 MJ9GZfmvj/t3WOOsoT+pOvf0jbbkq2XH+cNMOgBS2SWzl+2tRijx1LxhYk6+QrYO9Tzqs16xg/q
 P9Ox+l3WK/Potvgz5k0j3GamRgidHunuMza3e6f/M/GZzCnSDKcnZdWIJhdF4g6Mn4rz74VHEkV
 4TVsbMqhwKLreZoE0fQ==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b05ff75 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AXF9_A-i7_gDoTK9JAcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: eEsUVWyhVKhbUbl-g5K_-D3WDsKFvIod
X-Proofpoint-ORIG-GUID: eEsUVWyhVKhbUbl-g5K_-D3WDsKFvIod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131950_721643_8B929C23 
X-CRM114-Status: GOOD (  30.51  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
> Currently, ath12k_mac_op_change_vif_links() derives the links to add and
> remove from the old_links/new_links arguments: it creates a link vif
> (arvif) for each link in ~old_links & new_links and frees the arvif of
> each link in old_links & ~new_links.
> 
> However, mac80211 invokes drv_change_vif_links() both when the valid
> links change and when the active links change. In the first case
> old_links/new_links are the valid links. In the second case they are
> only the active links, while vif->valid_links is not modified. A link
> that is deactivated is therefore reported as removed, although it is
> still a valid link of the MLD.
> 
> To fix this, derive the arvif lifetime from vif->valid_links, which
> mac80211 updates before calling the driver and which an active-link
> change leaves untouched. Create an arvif for each link in
> valid_links & ~links_map and remove those in links_map & ~valid_links.
> A link that is only deactivated keeps its arvif. On disconnect
> (valid_links == 0) every remaining arvif is removed. The WARN_ON() for
> adding a link that already has an arvif is dropped, since links already
> in links_map are not selected for creation.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 315d80be304a ("wifi: ath12k: allocate new links in change_vif_links()")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 3f106ac6141c..28cb549b1f46 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
>   			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
>   {
>   	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
> -	unsigned long to_remove = old_links & ~new_links;
> -	unsigned long to_add = ~old_links & new_links;
>   	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	unsigned long to_remove, to_add;
>   	struct ath12k_link_vif *arvif;
>   	u8 link_id;
>   
> @@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
>   			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
>   			   vif->addr, old_links, new_links);
>   
> -	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
> -		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> -		/* mac80211 wants to add link but driver already has the
> -		 * link. This should not happen ideally.
> -		 */
> -		if (WARN_ON(arvif))
> -			return -EINVAL;
> +	/*
> +	 * Link objects follow vif->valid_links, which mac80211 updates before
> +	 * calling us. old_links/new_links only describe the active links and
> +	 * must not be used to decide object lifetime.
> +	 */

This seems quite ambiguous from the mac80211 code flow,

Consider a 2-link STA associated with an AP, where one link is removed 
by the AP:
wlan0: MLO Reconfiguration: work: valid=0x3, removed=0x2

In ieee80211_ml_reconf_work(),
Initially:
valid_links = 0x3
active_links = 0x3

ieee80211_set_active_links() first removes the link from active_links:
valid_links = 0x3
active_links = 0x1

This calls drv_change_vif_links() with 0x3 -> 0x1, but ath12k would not 
remove the corresponding arvif/arsta since vif->valid_links is still 0x3.

Subsequently, ieee80211_vif_set_links() removes the link from valid_links:
valid_links = 0x1
active_links = 0x1

However, the call to drv_change_vif_links() uses:
old_links & old_active
new_links & sdata->vif.active_links

which evaluates to:
0x3 & 0x1 = 0x1
0x1 & 0x1 = 0x1
Since old_links == new_links, drv_change_vif_links() returns without 
calling the driver.

After this, mac80211 removes/frees its link object, while ath12k still 
seems to retain the corresponding arvif/arsta. Is this expected?

> +	to_add = vif->valid_links & ~ahvif->links_map;
> +	to_remove = ahvif->links_map & ~vif->valid_links;
>   
> +	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
>   		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
>   		if (WARN_ON(!arvif))
>   			return -EINVAL;


-- 
Ramesh

