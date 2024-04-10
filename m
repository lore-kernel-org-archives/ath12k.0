Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A97CD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 09:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69XpRfCxp0+5Q/zhx5TDPs7ME9TL7fE+00ukrSeOfpg=; b=DDYrp0n+YSiJLcqT6HSOFFP4yQ
	bHb5oR7ecyVYtbsKHLQsljxaiNBHuPbRmix3u+u/5akEgxUMDDv8XQ6XFS6oCqhRBPB5psasb44RO
	05NoXDvAKcihllekXx63XVyeOmDzsN10CJSRYOMZbwlzUUgctKxD5quFIvsf/FGgGfg0rMJlih8yA
	TVIU0PnpKt54nhxeE7G0ruP4JVu5c/4hTaM1sYbuqwC3NEHsLhNvm31kgBYWVB0VPMA8mg/ylMZxX
	CK88HThGrKZ2TKVnhRAlkFu0PsxZFVm5dgdkWuJmlzX/lrw4IfcV8K721zbv7mzD1eo/eR0KRYflz
	K1D87Aew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTwa-000000062at-0zOY
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 09:08:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTwW-000000062a5-1cLz
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 09:08:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43A7bS6d005668;
	Wed, 10 Apr 2024 09:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=69XpRfCxp0+5Q/zhx5TDPs7ME9TL7fE+00ukrSeOfpg=; b=pP
	F2s6ilDMCs2gNvC8vcPVgd2p7qxrSJ5y1ukwK6OgZxWoslSFYEzRDsajhOz2Tw9z
	UkPWYPtUiRHWOnzmkGdCwPC1hS8o68e3KdZdkC3ECFLRmSZW9klsdFxq5V4/9IsL
	bdK8b6eeDtqz/w/MI8s3fLLAuxnlakG82q70RR5q0zMUGPZtab9mt+I6k5GRsljq
	u2Qb35wDZsRZWNnHOio/NJtav2qhMhDgb7i8xQppFro2UgMzxPZHoHHEp7ih7PeA
	F59yt29ddxDqw1I2hmaA0mR5AaretW8MAi4WlxGII/Etb7guAGcClieYe8oG8HHv
	7wUQtc63JqjLqhyXlwtg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdpharfya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 09:08:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43A98UCs005523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 09:08:30 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 02:08:27 -0700
Message-ID: <d2e6360b-1092-4e57-47e6-c5f336f32c92@quicinc.com>
Date: Wed, 10 Apr 2024 14:38:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise multiple
 radio in one wiphy
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: diEgu_66qCdiLZoIpjt4XWGbI8Qep39I
X-Proofpoint-ORIG-GUID: diEgu_66qCdiLZoIpjt4XWGbI8Qep39I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_03,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=579 mlxscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_020833_864495_E071BFFD 
X-CRM114-Status: UNSURE (   6.21  )
X-CRM114-Notice: Please train this message.
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



On 3/28/2024 1:16 PM, Johannes Berg wrote:
> That's a big set, not sure I can review it all at once :)
> 

I plan to separate the code refactoring changes from this patchset. Do 
you have any concerns?

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

