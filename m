Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70ABC83F3E
	for <ath12k@archiver.kernel.org>; Tue,  5 Sep 2023 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSwGLJZOuWATRBZfoeDIanSOtF/khbMm5qQWeMzV0Yw=; b=B/MxFtiWWKGAHU
	LnRpqaSttreAbxAIMfxM8kWKO2IgzczghMzzQESYCPNHjMSUKqsuMyTf92QukBBANQNM9F2Gw77v6
	bPNdbQUW6cAPd6I4PmkbHxZJ9wN4KquyIryyncTF9s9N0yiQKRbnvN1ypxrQhS0v+HQdt2bGBaOn4
	mDZacDd7dYuJkHmxY+Qd8HMCsSxK00IV0iP7mas/6FXmAeuAGT7W64GYDouwYZ18MHqGAMsrPkwx8
	tg9jW24ipax9LBoHHIFWaq6Y8j2fmZKRjlLFU9BVhyosUC2stv5EwKY5qByA2jJZWUPFuW+kO/n2Q
	lFEJnOyND6fHRSwznC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdZV0-006QzH-19
	for ath12k@archiver.kernel.org;
	Tue, 05 Sep 2023 17:05:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdZUx-006Qyp-0f
	for ath12k@lists.infradead.org;
	Tue, 05 Sep 2023 17:05:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385Ds9tv023231;
	Tue, 5 Sep 2023 17:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9DwOYdzyCmrvCcBYnB48qZv4FwVwBCfPHgm3VjQekZs=;
 b=V77YIYkdQLbF0g6ZDK/gs0QcPLGmRYxx91jXdCjLO7h+Ux34wrZIpwQXeHAQtajJuY3l
 mfYr1UUAowSjsSrJqMohvhPwdB6wN4SYIDd2CeAPlRQoLizfqfjtcoykV7LNZq3mbmU2
 swKGSGLuWIOBryxXx9mwcAXDGG5z1Sn6R0QNOAX93r9EpTxQvhYrlAlSB4KnkX5FgGWX
 RmLlR55r286fCE4Wv7n9lgmOwZ+tIqafuzfYKd0Sd/2eA6f3tpz+QHsmW/uDNf+ziWHT
 uvCOsg/09Ef1slGIAKHz2uSKEEFXy+RJImVniBLbEqrgTIzhC83za5UA1lWmUFTUOhw6 JQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3swsp59tsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 17:05:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 385H5rHr012051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Sep 2023 17:05:53 GMT
Received: from [10.111.180.119] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 5 Sep
 2023 10:05:52 -0700
Message-ID: <a1e4f4fd-7558-412f-8011-02740b8cf4a9@quicinc.com>
Date: Tue, 5 Sep 2023 10:05:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix recovery fail while firmware crash when
 doing channel switch
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230905105229.10090-1-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230905105229.10090-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gTOB22NbLKiwrQj06szoJQDC5dvqROGQ
X-Proofpoint-GUID: gTOB22NbLKiwrQj06szoJQDC5dvqROGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309050147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_100555_362908_26054D5E 
X-CRM114-Status: GOOD (  19.11  )
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

On 9/5/2023 3:52 AM, Wen Gong wrote:
> When firmware crashed while channel switch running, recovery starts in
> ath12k. Then ieee80211_sta_connection_lost() will be called by function
> ieee80211_restart_work() in mac80211. And then many WMI command timeout
> because firmware is crashed. Each WMI command cost 3 seconds, then the
> total time will be large and leads recovery fail.
> 
> Hence change to set value ATH12K_FLAG_CRASH_FLUSH early and then
> ath12k_wmi_cmd_send() will not wait 3 seconds, then recovery will be
> started quickly and success.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath12k/core.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 3df8059d5512..56be7298ac86 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -685,6 +685,9 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>   	ab->stats.fw_crash_counter++;
>   	spin_unlock_bh(&ab->base_lock);
>   
> +	if (ab->is_reset)
> +		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
> +
>   	for (i = 0; i < ab->num_radios; i++) {
>   		pdev = &ab->pdevs[i];
>   		ar = pdev->ar;
> 
> base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
