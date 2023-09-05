Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF799C83F3E
	for <ath12k@archiver.kernel.org>; Tue,  5 Sep 2023 17:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPGfsnt5+e5dF3VRpK/67AEppRdRWn3kAvjNjTIlgmo=; b=FggTtlgfcL0fSg
	S2u1tpwzeokqxjACYGhojIfbrhPyN19AJdTay/LRvO0deBCSfZO2ceaO2bP3eGPetMxg3XyIsNQki
	KiS6JAae8b82eiSNMZYd2w3hF90cKV3BllrespVvooRrMjgmTws0imym2NprSL+EV5AOT0oS45VIr
	wCHkRrSqu0uA/Vnt4Ye7NbJ791zp5/BjkI8uHmP7CNCgAF0Rq2NubLVOmuTFGQFpTL/IgOcdbroMU
	vUlGGe8EZ8TCXlv4a/wnfJuifJFnp184gJkFhFnm2JajqXiyRCKzZ+TOWl275NqcnbFGMgBWYLZhp
	TzGkUGYJrgD27kFCupDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdZUD-006QvH-1c
	for ath12k@archiver.kernel.org;
	Tue, 05 Sep 2023 17:05:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdZU9-006Qu3-2x
	for ath12k@lists.infradead.org;
	Tue, 05 Sep 2023 17:05:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385FbrD9028994;
	Tue, 5 Sep 2023 17:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VdYWOsg7YcRWRMM47bFyqzxarQ3BYLzoLAnShCegydM=;
 b=PW0L8k2Gw+4A1F9aAY+iwTXuzZ0/ZeZdHFdeLqSTgWmTSneH7ZKwoShXyLwPLBzWT70V
 sgqtKgO8dspnNVPx86kosf+LCVqsj0EFQ9/knQ1RlLE86OaQNA0KQ6VSzX8Iq1vK6whq
 CcqZeTdYPBiNtGuHkld21dMZdgdQPA+E9evz8BkmXqrHjlnt38IP4DYixkpW6tXFsj2z
 8zfC7SFJoHfVLSn2Q34AxSO0HFf0yC1i8dtg2pLEizrdUEjiWoltZhI/6lb+xe1vAZLp
 3h849ybx6zZgZwyZtfG6BONy3FzOGFxmzhFQp0NH+Bf2y/UHeujWsKJmCqby0fiwrxgK xw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3swpr6j1qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 17:04:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 385H4w3B020172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Sep 2023 17:04:58 GMT
Received: from [10.111.180.119] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 5 Sep
 2023 10:04:57 -0700
Message-ID: <cc57c0fd-e6e0-49df-910b-2ce1204d3d41@quicinc.com>
Date: Tue, 5 Sep 2023 10:04:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: indicate to mac80211 scan complete with
 aborted flag for ATH12K_SCAN_STARTING state
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230905105947.10369-1-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230905105947.10369-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NMnIKxJ5Ka7JMz-HB-NoiTkOuM0yqYv3
X-Proofpoint-GUID: NMnIKxJ5Ka7JMz-HB-NoiTkOuM0yqYv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309050147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_100506_095277_99DAD3F1 
X-CRM114-Status: GOOD (  24.50  )
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

On 9/5/2023 3:59 AM, Wen Gong wrote:
> Scan failure can not be recovered from when running a loop of the
> following steps:
> 1. run scan: "iw wlan scan".
> 2. run command: echo assert > /sys/kernel/debug/ath12k/wcn7850\ hw2.0/simulate_fw_crash
>     immediately after step 1.
> 
> result:
> scan failed and can not recover even when wlan recovery succeeds:
> command failed: Device or resource busy (-16)
> 
> reason:
> When scan arrives, WMI_START_SCAN_CMDID is sent to the firmware and
> function ath12k_mac_op_hw_scan() returns, then simulate_fw_crash arrives
> and the scan started event does not arrive, and then it starts to do
> recovery of wlan. __ath12k_mac_scan_finish() which is called from
> ath12k_core_halt() is one step of recovery, it will not call
> ieee80211_scan_completed() by logic currently because the scan state is
> ATH12K_SCAN_STARTING. Thus it leads the scan not being completed in
> mac80211, and leads all consecutive scans failing with -EBUSY in
> nl80211_trigger_scan even after wlan recovery success.
> 
> Indicate scan complete with aborted flag to mac80211 for
> ATH12K_SCAN_STARTING to allow recovery from scan failed with "Device or
> resource busy (-16)" after wlan recovery.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 0f2af2f14ef7..a99324dbe7ad 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2780,18 +2780,21 @@ void __ath12k_mac_scan_finish(struct ath12k *ar)
>   		break;
>   	case ATH12K_SCAN_RUNNING:
>   	case ATH12K_SCAN_ABORTING:
> +		if (ar->scan.is_roc && ar->scan.roc_notify)
> +			ieee80211_remain_on_channel_expired(ar->hw);
> +		fallthrough;
> +	case ATH12K_SCAN_STARTING:
>   		if (!ar->scan.is_roc) {
>   			struct cfg80211_scan_info info = {
> -				.aborted = (ar->scan.state ==
> -					    ATH12K_SCAN_ABORTING),
> +				.aborted = ((ar->scan.state ==
> +					    ATH12K_SCAN_ABORTING) ||
> +					    (ar->scan.state ==
> +					    ATH12K_SCAN_STARTING)),
>   			};
>   
>   			ieee80211_scan_completed(ar->hw, &info);
> -		} else if (ar->scan.roc_notify) {
> -			ieee80211_remain_on_channel_expired(ar->hw);
>   		}
> -		fallthrough;
> -	case ATH12K_SCAN_STARTING:
> +
>   		ar->scan.state = ATH12K_SCAN_IDLE;
>   		ar->scan_channel = NULL;
>   		ar->scan.roc_freq = 0;
> 
> base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
