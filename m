Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D86AC25B79
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33/366XHZMVVhIE508DvavCS7eBCyvvNtVp1d49Apvs=; b=QtqA1Cq1QhZ99SO2Lbyw7V1M8o
	e1DLc2eVtNqs60aHuqYhGseibzSxdAJA47iQS00WRZwmWbW+PtrdzDb1ptwd8Cq2UsefjAOyIERsK
	uQli/pVFytVt8OFEp5Y1epHwwOAsB71Xx0xYf6/BygUfwkC0D9fD29mp3sWiExFK1gqunSJU7YPaY
	hA72HqigyMN0IVhLnZZxMgAbq/xby/+R11eLnvgJKQIJwEMZ9a7AtA8JUrkjRamyRvbOz6G9Ztdbs
	4VWu2wdHGblZnUld1LEVtc1+Ultj2BLE/4b2kPWFrp1r5Z6Emrb1Dri336bKQkcheJOmJDzOv2Qr/
	FRpYPmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7J8b-00000002W0g-2Z5J
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 18:14:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7J8N-00000002Vps-1hCV
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 18:13:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90aag021385;
	Wed, 15 May 2024 18:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=33/366XHZMVVhIE508DvavCS7eBCyvvNtVp1d49Apvs=; b=oL
	wtA4OJBXqLmsLt0SpeLkdIu5G34Qq+8sU7N1gvC0BJ48Gy6K+HyPQQapDu+HrzCq
	26cCgzbAA7BTmh+9t6kGHf/G1kkTIFywFZtFXxsynH5jS0eQx4512TClM0/8dTi+
	z8WFmGKaps39bHPXQ0NpGz5a9IPRE6WiGdlKo8Q+bPYKzRYqUKDEwB7BkBBJenZj
	4By4eUQ0rOfjIr1pde3Mhv1Runz/99ZSgMyTygfYCkifMCir7EbmjdIZwjMMFDII
	qx8nGFvp7y3Djy2IpL3oNZfQlceWRRBlbEAlSeUC5by1alcj8cmqEZ4d4z8Z5Rp8
	R5Jwi0EyIfQ17zIRi6Eg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbbuv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 18:13:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FIDf8m019066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 18:13:41 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 11:13:40 -0700
Message-ID: <a304cc50-4160-4660-950c-18ed1fe15159@quicinc.com>
Date: Wed, 15 May 2024 11:13:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240515165231.12114-1-quic_pradeepc@quicinc.com>
 <20240515165231.12114-2-quic_pradeepc@quicinc.com>
 <32e7237f6dcf98254c2468438665a1b9357d2dd9.camel@sipsolutions.net>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <32e7237f6dcf98254c2468438665a1b9357d2dd9.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OuJ0OkQAtz9Rt0Su270JtbL1L6F8M40F
X-Proofpoint-ORIG-GUID: OuJ0OkQAtz9Rt0Su270JtbL1L6F8M40F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_11,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=918 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_111348_174998_45232769 
X-CRM114-Status: GOOD (  10.74  )
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



On 5/15/2024 10:45 AM, Johannes Berg wrote:
> 
>> + * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception (AP) or
>> + *	transmission (non-AP STA) of an EHT TB PPDU on an RU that spans the
>> + *	entire PPDU bandwidth
>>
> 
> I'm really not sure why you insist on neither fixing the documentation
> nor the implementation, but I'll say it again (just this once): they
> need to match!
> 
> johannes
Thanks Johannes for clarification..

Apologies for confusion, I was trying to remove 'AP mode' reference in 
commit description after your initial comment, so that it does not 
conflict with eht_80mhz_full_bw_ul_mumimo's description in code. Also 
was trying to replicate "he_full_ul_mumimo"'s comment in code.

Anyways I understood now (hopefully :)) now and fixed it in V6.
Please let me know if you have any other comments.

Thanks
pradeep

