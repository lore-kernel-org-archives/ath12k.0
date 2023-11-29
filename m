Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31717C4167B
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/ryVWRKjgbgQVhAJvh51hAu/CIQjx7Gc8kYcGJaFf8=; b=ccUq6PaGc+vTzZ2AHW+zeIjICy
	kOGjwLCbQtDfr+QMdYYIy0JNDm9wW/1IzBZrZixkRrwqS9L5ihGDKmznagBS4V8nnMra6v/jLmrle
	eTeRiqBXn8IWH4WP0KNEMbvytzUt68i3HT45WwDZDAAvFYAZLQ0vfOHxua6mSafPkZxj3S78H+IYP
	M6vhL5fUwDBwxUAr6RpydNVeeYxYQUe30TCeARzBWpYsRPtn2FLQJ5JhIYMseA1ONg8kK1zW6xxLu
	hIK6BoIcdSSpdbSIYqIJaww4kTdUBycGvXBQuuj2tltjoqA3cdO3oKU1qoVxFgVojQX8pap1G/Bex
	VwasqlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Mb9-008lb4-30
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 15:35:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Mb7-008laX-2U
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 15:35:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4mV1K010192;
	Wed, 29 Nov 2023 15:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=d/ryVWRKjgbgQVhAJvh51hAu/CIQjx7Gc8kYcGJaFf8=;
 b=QEbX5z//a5ktsux5OL0zs93hlJ3MpNCb+Ik+HR8uUdzGQOQo8z7JrkN7OEKrS5YCU0is
 B6tar2QfA5JYV6DaTaXEDCW+dmGgPonN2zHCmhteFswc/AYVjkAnEad70xaATr6B03TD
 tM1tDzHZVVWMffqFohgu6YxurjN6PjA2ZAWRY3ZCfgyMxiTWxEkD2jMPZ8Cu13ryTXop
 kw9Pi8Fqu+aI+Q+J2Vir+1NL6DzFWU7rP8GRb7LQtNQw403pcAbqEEhx2soTcaJchNro
 9iel4Um0cdldDjuRtEpJmjjlOXRC5xlk8DSq9zE50ap7BT7aSeFksw/oNPIZC4frLzIG dA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unnpetnb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 15:35:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATFZVcr021633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 15:35:31 GMT
Received: from [10.110.63.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 29 Nov
 2023 07:35:31 -0800
Message-ID: <dcd22066-6256-44bf-b9d8-7d3dbc168094@quicinc.com>
Date: Wed, 29 Nov 2023 07:35:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] wifi: ath12k: add support for BA1024
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231129020414.56425-1-quic_bqiang@quicinc.com>
 <20231129020414.56425-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231129020414.56425-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dlaVPZok3OBK01dsLf5ikFv2Okwok10O
X-Proofpoint-ORIG-GUID: dlaVPZok3OBK01dsLf5ikFv2Okwok10O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_13,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=817 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_073533_925646_D12FAF4A 
X-CRM114-Status: GOOD (  12.52  )
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

On 11/28/2023 6:04 PM, Baochen Qiang wrote:
> Currently the maximum block ACK window size supported is 256.
> This results in that, when connected to an AP which supports
> larger BA sizes like BA512 or BA1024, only BA256 is
> established, leading to a lower peak throughput.
> 
> So add support for BA1024, this is done by allocating a larger
> REO queue and advertising IEEE80211_MAX_AMPDU_BUF_EHT support
> to MAC80211.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


