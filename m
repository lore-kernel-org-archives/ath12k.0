Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6186C47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKL69xHVpkYC4jBDgrX39I6XFRRzyUFFR9HVSRdrjiI=; b=SG6pOgMKTxQ/TYxhG61Pz1W9rb
	t322G0C/hyDTXmTga4QOFH6vtIPplYu51zvZdt7hDyNU8o9IAE18eG53XHnFmAB9SoAp/gtabz2BM
	RhD3rEB6hlX4Wd5uJRmHjDhXPFNtd+HJp17X5bMgea6TzqWtONvasVEmYD/79NIu2q/D8pEzYdgwI
	Kz6iVEKz6j2Q7AvdROa+ShBkshgqBi337iuVY1Mmq4/FBFSnvJ+H5xQcVfB3w+xpDuQaVuvzOiEmy
	ZAsRGUxZFsDCukHWfqF8mKYmGDI6hilk2SI+v/cU7yth2MiVbPmA20heX8HDH/C806CSgH2iPfBcN
	0xvuI8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ21O-00F2MW-1L
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 09:15:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ21L-00F2LU-0i
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 09:15:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40H6cVls022031;
	Wed, 17 Jan 2024 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=TKL69xHVpkYC4jBDgrX39I6XFRRzyUFFR9HVSRdrjiI=; b=EW
	vHpqslC0xqjg8pP/WuKc+objRKbGBcz05ptuLL/a1hL4sI2u1r3pKAQIUkIP/hpW
	rWAKGXhtwBBWek79GTwT++K5rdCyqH+mUhR/96fD+WZDnzyzuE0lask0WbRs20F2
	4MVLxgIueL73nZNqKBEm8RJWWIZs5z1Wv2wY3VLeP+/cu1Cn+t5O5ORNMbejblzQ
	41NeqJFaN+VEW5vm52AXHF0dt9r+sq/G1pgblkPRsJcYb/CbSFfJmpfYaep5THkE
	VSX8KgaK9DTY10HZhs2XFfgcEzOVJEBzy1Led8BKboOz3RnBT+/OluSlYRKWcPNO
	0bf/vN7n2/RBb2jYKmWg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vp4ak0wu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 09:15:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40H9FZC6014361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 09:15:35 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 17 Jan
 2024 01:15:34 -0800
Message-ID: <da4cb6c3-4941-4efb-aff6-4948ed311b99@quicinc.com>
Date: Wed, 17 Jan 2024 17:15:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add support for collecting firmware log
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240115023726.2866-1-quic_bqiang@quicinc.com>
 <87ttnc5oar.fsf@kernel.org>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87ttnc5oar.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: un5XB6o1pzi7hAzxdVRj3KRSUvKTx7RB
X-Proofpoint-GUID: un5XB6o1pzi7hAzxdVRj3KRSUvKTx7RB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_04,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=849 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401170063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_011539_268664_47B36C38 
X-CRM114-Status: GOOD (  15.39  )
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



On 1/17/2024 4:58 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> Currently there is no way to collect firmware log because firmware
>> does not send it to host. Also host does not handle WMI_DIAG_EVENTID
>> which is used by firmware to upload firmware log.
>>
>> So add support for it by firstly enabling firmware log upload via a
>> QMI message, and secondly processing WMI DIAG event to expose it to
>> userspace via trace event.
>>
>> This change applies to both WCN7850 and QCN9274.
>>
>> Tested-on: WCN7850 hw2.0 PCI
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> I did some cosmetic changes like reverse xmas tree, debug messages etc.
> 
>> +static int ath12k_qmi_wlanfw_wlan_ini_send(struct ath12k_base *ab, bool enable)
> 
> As enable was always true I removed it. We can add it back later if it's
> needed.
> 
>> +struct qmi_wlanfw_wlan_ini_req_msg_v01 {
>> +	/* Must be set to true if enablefwlog is being passed */
>> +	u8 enablefwlog_valid;
>> +	u8 enablefwlog;
> 
> 'enablefwlog' is really awkward and it's used in several places, why not
> 'enable_fwlog' which is far more readable? I could change that in the
> pending branch.
Yes, Kalle, it is more readable by changing enablefwlog to enable_fwlog.

> 

