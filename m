Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F106ED35660
	for <ath12k@archiver.kernel.org>; Wed, 28 Jan 2026 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUBYL6RZjVFsIo1jzKugu9DaCmQl+n+h37h+zcrRbuE=; b=FpJXcp0shAq+XJztDA3kcGzHk4
	2Gqerl4ByrL+dfK3ZIe92MP7bVQJnrUEu/pzmzbU/k3OCUidSYBlT+gIxubclxBuTxxmsEeHgEmGl
	3k7ek6vyKBp0FHegmzKR6Q6vGuOacdnE12JqehZMI3rW94CCZtxyh3oZ3jA25Y4Ze82J4YgYeYVSZ
	QuNp/P1c4+XTcDn+i6cXH90y2W8hptGXfXvlcUWCEujVFtQxrmin8suzkqS6+iprTlSH/RuhkCNwE
	7wHlhJQ1FniRofMPxAmmTs0qevIlSwskOnKZsm6FKKwDXje+f3J3bzyMXHVq/W0cZCYnjQv9U3aCN
	/Th9OFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkut8-0000000FHS0-1GNh;
	Wed, 28 Jan 2026 02:02:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkut4-0000000FHRd-2TiC
	for ath12k@lists.infradead.org;
	Wed, 28 Jan 2026 02:02:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RLk71a1065900
	for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 02:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eUBYL6RZjVFsIo1jzKugu9DaCmQl+n+h37h+zcrRbuE=; b=aL0iERnc/R7SGW4x
	fg/3YjTAdHSEn/gOZewu/4kEuTA1wSNFRHkOt68aJ47RNGLcuGB/lgaxaySs5msH
	utP+NcUpVO5WnTj7iYsaC9O8qEGCgnoBNlsUMBGFina49RazD+59O6Gy2DhBgmHq
	bZjcS6hNKQtbS8mf8NLoAe8sKWafwU1/QyLNFAhtYIY8CyPIpGZCKOUjRaLIhpug
	/iRpasIZzDR2XdQJPlYtgCyV+ChM+xYbAcsxr2H7hEjjchaw/mK2UomAIdRWlTi4
	QXFOdoJa7G/tPxtnp44Akn3adCeg8io1hkyYKHgKGiebMw7olZt/3/2jC5N3STTe
	UhMBkg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x262f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 02:02:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f3c36dd2cso4612674b3a.2
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 18:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769565749; x=1770170549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUBYL6RZjVFsIo1jzKugu9DaCmQl+n+h37h+zcrRbuE=;
        b=PXDol1Jp3gddsFWQVzXIZW52Wm5bYvNaTD1C5aHYX+MYUtoTjos6ylOUlbVkSMIEw3
         dfGz4c+90Jiqj5/KgMMbCVHRdql9D43DgCQM/AMIP2IKtD/HZvzqq5f5Wzyipf+mxV2X
         LiyWfhHlEQh/H+OsD2zagSHjCp//nbFLU5FZybk43VqajqitFEFhR+fK03WvgfBpbQTC
         NmG5NM6g5HxW4dH3YAz/GjzwWydnamGDYXAjHlfNqD6hIpqzjPPiuRs7lg7Pc1GcKvPZ
         vAzW/6F1NLCy2JA0Vbyn2jqydvnOvCjpXDhubrLt1r9exjkW5JBrWiwZh31DJEFEvmZS
         czMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769565749; x=1770170549;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUBYL6RZjVFsIo1jzKugu9DaCmQl+n+h37h+zcrRbuE=;
        b=gFNkaS8xfvPsKOR3t4Ep5zET+udbkt3FXxGNwhKPii/4y40qDN5lhBDlxlFJx7ObxQ
         iSa1vQJ4612N3neYsmKSxgagUNNzif22DbHj++q2RtwaVJ/qjzbEEZL5vCn+nSfStvtN
         T8g3GA1U1c0wixNFzmW6e5Qv8hNfMrfH5xhsLreNzw9HNAMNdJRmiLhYYJcf+EeET2Fr
         FdrQj7/b4W9YmBR5YAIKVIj6unn2TFlXs1OUsdacFbrufuVlzb4zMBxVh7IkfoHYyYIR
         PwF3SG9MayM8D16LvsRAhtouM9/46Pkir8bDo8+q6afyxMvfpxQ5H7QCAX5SuAjM6z2j
         r3BA==
X-Forwarded-Encrypted: i=1; AJvYcCVAe9AA7oOOGJmq5ulEqiIdCMA6FCBdpTkUc8vzmjX0O2TW78N+lFfltfwtE7bf3/nb4d4Xin4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNrL0KCXSlt+mjaa5yWoqcvmYEGob4ByYIAc0yZsbpUXJ/UDNt
	O6h/c1aNFdI63o+YNSllFTcmkoK93E88j8q/Eyrro+7MlEUqhUMCUb9ePEgDcgC+I3E0hxG4AhG
	g8kzAAQ9pGH6NVKA3FKAwXYchI5YSwYbi9Ru0Vc+/Wn4eXo9f/3z9vTFsqPxMn8tP
X-Gm-Gg: AZuq6aJ5fLUoVpqsfhMXbfSd53lr+jEJC2W9SKBQAT0vMRu7HxHbGbUSqhjMBpn7sqi
	l4j9Mmyi2U2IY6WJT/TiZOldEZUEeIekLC/BS/WImqoUBiClsLaFQcMrXYu9qR2x6eN4KXaQnn5
	rAedu9gG8jbskV+Mb34xNv2kxAGvgLi+0O7wCpDlhOVcsS6VMPcn5qMqgd+hcOq6KVmfiuoA89w
	IQWgiFBH1MfPfHya7Kr0oQieduUmSVLfDP3p3z5CHtmfOROUffM+LKaJv+iG/IlLWcUbJTHLbVr
	41LEA4Kambh8joYdXUf2RnhMvgZlsLKk/BVWjjc+3GpSI4uipVRV3W09ecWVLeOqB6CsbI+59wm
	m9eIsofpDPJADFEvI7jifWPWLkppGWhysYLV2G2JOc0sBIY1l245U3NDbqS8ahtjgtvjfFxI=
X-Received: by 2002:a05:6a00:a29:b0:822:d43a:103f with SMTP id d2e1a72fcca58-823693110c2mr3481274b3a.60.1769565748996;
        Tue, 27 Jan 2026 18:02:28 -0800 (PST)
X-Received: by 2002:a05:6a00:a29:b0:822:d43a:103f with SMTP id d2e1a72fcca58-823693110c2mr3481238b3a.60.1769565748310;
        Tue, 27 Jan 2026 18:02:28 -0800 (PST)
Received: from [10.133.33.215] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c241afsm788264b3a.56.2026.01.27.18.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 18:02:27 -0800 (PST)
Message-ID: <ae79035f-4428-4a5c-93be-68d065df1318@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 10:02:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: clear stale link mapping of
 ahvif->links_map
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260127033400.1721220-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260127033400.1721220-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OBpNs62CvqSdDu46feNVMYbsQ-INFXa1
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=69796e35 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3S48Id3VpGTgTVoLZtsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: OBpNs62CvqSdDu46feNVMYbsQ-INFXa1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAxMyBTYWx0ZWRfX8k+fsqd+JWMx
 1t2af0kStxOg5197EK2AI7FE7wCm7ip4BnA++ThEP7NX+1CbCvROd6rpUsDHhS+clkEKzUaoOUg
 BWnod7np+MSkNKaZ4gYLFxHpuRJ3tiUjE/Sbfh+fNYqZXJgrrWQJ/PmRYJsKXLrt0GQqKLH8mas
 ajsm6iX8284wFYqZmhA915SwQPmW+JZyneu6wScOGPiYTRgUI3RyDt8Rd/XhfQ+/lm2LU9SRHWK
 qSYpFC33306BF/t9aGWPN8PXSjh9N1CFNC3oig2SnHIXV+lcJtBBdgDIX8cgVOeeKAhU9Hbfeet
 fWFLuritbphaMMPacnSEj2H12nHJqRHMf+ma+LGjHwy3rkSaY8DMIDx2uBYz7aQxphaJpX4uY2G
 SI3/i6VxkA3HBZFxGpIts1sbag+5xhvkqJSlSto/5zhvL7/kE0oFJZSPq943EOLTKTd7SsSf/0p
 5eavRWzChgrBQABFqUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_180231_224234_62821992 
X-CRM114-Status: GOOD (  19.90  )
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



On 1/27/2026 11:34 AM, Aaradhana Sahu wrote:
> When an arvif is initialized in non-AP STA mode but MLO connection
> preparation fails before the arvif is created
> (arvif->is_created remains false), the error path attempts to delete all
> links. However, link deletion only executes when arvif->is_created is true.
> As a result, ahvif retains a stale entry of arvif that is initialized but
> not created.
> 
> When a new arvif is initialized with the same link id, this stale mapping
> triggers the following WARN_ON.
> 
> WARNING: drivers/net/wireless/ath/ath12k/mac.c:4271 at ath12k_mac_op_change_vif_links+0x140/0x180 [ath12k], CPU#3: wpa_supplicant/275
> 
> Call trace:
>  ath12k_mac_op_change_vif_links+0x140/0x180 [ath12k] (P)
>  drv_change_vif_links+0xbc/0x1a4 [mac80211]
>  ieee80211_vif_update_links+0x54c/0x6a0 [mac80211]
>  ieee80211_vif_set_links+0x40/0x70 [mac80211]
>  ieee80211_prep_connection+0x84/0x450 [mac80211]
>  ieee80211_mgd_auth+0x200/0x480 [mac80211]
>  ieee80211_auth+0x14/0x20 [mac80211]
>  cfg80211_mlme_auth+0x90/0xf0 [cfg80211]
>  nl80211_authenticate+0x32c/0x380 [cfg80211]
>  genl_family_rcv_msg_doit+0xc8/0x134
> 
> Fix this issue by unassigning the link vif and clearing ahvif->links_map
> if arvif is only initialized but not created.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 81e4be30544e ("wifi: ath12k: handle link removal in change_vif_links()")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index cdb72439dcf4..9a926f5b7e8a 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4281,8 +4281,10 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
>  		if (WARN_ON(!arvif))
>  			return -EINVAL;
>  
> -		if (!arvif->is_created)
> +		if (!arvif->is_created) {
> +			ath12k_mac_unassign_link_vif(arvif);
>  			continue;
> +		}
>  
>  		if (WARN_ON(!arvif->ar))
>  			return -EINVAL;
> 
> base-commit: 13f9e5344a517048f3d8c61e49a9a72f97410de3

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


