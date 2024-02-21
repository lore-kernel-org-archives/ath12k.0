Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7113EC48BC3
	for <ath12k@archiver.kernel.org>; Wed, 21 Feb 2024 00:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:CC:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VayybIripCuAYUA1O5LtW/4Td0er/jINiZxZijN5cQk=; b=A9ag14fQT7v43TShm/T/FMFVV8
	CqDBFmX1KQv1jUtRkuzsXejMQG4JzjbyOaolOCaOLCbOnRO1NjHmBD7lBsaYwsp/H6FRgh4bOGKw0
	2sinOtjNRSw9qvmRfK7yX9mVUWuwGspEE/rPtjUkxijWcq8qE1dDC3OCZQjg1zDCqQyUfv6AdaSQ4
	K0rO3paent3skM+PZdTHmWCgQCDpj03beZCKYZjpzW+2m/nC6V0PB9GWFcbUtxMSvXOgMeO+f2Brp
	iG1+j4kCybW1EYikVyPrDE24h7oBKdf+K8Odd/e+LT/pLL1qogflSWS3oki5d0QMroKm4DToHCSak
	APxEJD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcalB-0000000GfLU-0e8G
	for ath12k@archiver.kernel.org;
	Wed, 21 Feb 2024 00:46:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcal7-0000000GfJL-0rBD;
	Wed, 21 Feb 2024 00:46:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KLRlt6025092;
	Wed, 21 Feb 2024 00:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:cc:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=VayybIripCuAYUA1O5LtW/4Td0er/jINiZxZijN5cQk=; b=XC
	pFBesBI9znpRNwiDy7WvNiiQqSEKDGmkl3fb/w7VTAMfkR6/SpkkVhpX6P+kWaEW
	JLKsDlv7dyzf+TkRyvdUq390X8J1MTIXryCwKE4iLKKnc6OB6MtqvcngxaMWQz8b
	xGuCD+WEQY7OtzNYnO8FEwtt2pfoacBhHWhB+K3Is4tB8YIkHArewfmw4HvAvuFk
	h0rrFEub2eM90TGthGLnhLxF85GtyCGl+JGetQ/2G2ylXHVwZI8hG3MmV/uiT74n
	4GR6YNuFsoQ6A7SmtC5mOqpq1p4NA+8Q2pDHEFGXaE7B42VhBKnLp3WHppo44qah
	3lSo50NPAhTdXmfL/A3g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21x0k6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 00:46:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41L0khgS016606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 00:46:43 GMT
Received: from [10.110.34.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 16:46:43 -0800
Message-ID: <a35eca5b-e6e6-46e8-85b5-dbcbda0d2f04@quicinc.com>
Date: Tue, 20 Feb 2024 16:46:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k & ath11k beacon miss detection
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
CC: Kalle Valo <kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H1hB0zOZ4PHHCoZEGJVuwnodNE9A6cnj
X-Proofpoint-ORIG-GUID: H1hB0zOZ4PHHCoZEGJVuwnodNE9A6cnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=760 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402210004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_164649_293126_32BDBA14 
X-CRM114-Status: GOOD (  25.93  )
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

On 2/20/2024 9:11 AM, Nicolas Escande wrote:
> Hi there,
> 
> I found that when using QCN9274 iun station mode, we never get disconnected from
> the AP even if it stops beaconning. Using iw I can see the "inactive time"
> increasing without supplicant ever getting a beacon miss event.
> 
> From what I gathered, given we set the flag CONNECTION_MONITOR using
> ieee80211_hw_set in __ath12k_mac_register (mac.c) we should detect the
> connection loss and call ieee80211_connection_loss() at some point. Right now,
> there is no such mecanism in ath12k.
> 
> So looking at ath11k code I found out that in that driver we have a specific
> WMI event "WMI_ROAM_EVENTID" that can report a WMI_ROAM_REASON_BEACON_MISS that
> in turn ends up calling ieee80211_beacon_loss after some time.
> 
> But trying ath11k & qcn9074 in station mode yielded the same result, we never
> get the roam event and never get disconnected either.
> 
> So going back to ath10k this time, the code isn't exactly the same but even then
> we had the same wmi event, with the same WMI_ROAM_REASON_BEACON_MISS and we'd
> call ath10k_mac_handle_beacon_miss which in turn ends up calling
> ieee80211_beacon_loss via a work item.
> 
> And using ath10k on qca9888 works well for me.
> 
> So I have a few questions:
>   - is this supposed to work on ath11k ? Does it not work for me specifically
>     because of my chipset ? Or are we missing some wmi config ?
>   - as the code to handle the roam event is missing/commented out in ath12k will
>     it be a different mecanism to detect connection loss ? Or it'll be the same
>     and you guys just did not have time yet to tackle this ?
> 
> I'm happy to add the missing code to fix that use case in both drivers but I'll
> need some insight from you ath folks on this.

The ath12k driver is still work-in-progress and there is quite a bit of
functionality missing there due to the refactoring to handle 802.11be
Multi-Link Operation. However I'm surprised that ath11k has this issue.
I've asked the development team to look at this. It would be helpful for
you to open a bug to track the issue. Please see
<https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport>.

Thanks!
/jeff



