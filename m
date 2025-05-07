Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7237EC3ABB6
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 03:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjHS2jvzE3fLt5mzcFB0wHlb9QSWh9And5JCeyRaigI=; b=vvw4qpgPmE03bDUJCZdhv1xeFO
	grWSGwYQI4Oytg91p+jjYi+tXXNLtqxxuoma7vnub0UqFMdIxnk1Bt2+JgYTQwfScMFxscJdeu652
	RXArd6Vy35ldL+fVfJxeAN0OUed6PqUwLW5HA7+YrxpclHgSo3HznDZPBzGhzmDrPUZRKkdCXiwIp
	XNNuKKyKmaGCivqX/3vOoUN8RXtYw/QGeoTG0247Hok3/DNx0Yj2TpRAHR8BDkqPJIiBPhjuw/7x4
	uFCSFcv68yBUnt5JM/fZmSxxe2qMQRSeuo908RFvbQQ5pZO1qq+oxyi/SFUeJVvkzxwXHvQ/vNm/5
	SJHydXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVj8-0000000E6hY-0net;
	Wed, 07 May 2025 03:45:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCViK-0000000E6b8-1S9C
	for ath12k@lists.infradead.org;
	Wed, 07 May 2025 03:44:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H6pc019970;
	Wed, 7 May 2025 03:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjHS2jvzE3fLt5mzcFB0wHlb9QSWh9And5JCeyRaigI=; b=HNUGD5T1jMC6F6Gc
	D4UT1hfvbQNwit1c0BxkACdLIKMzOlCBEAgUD8preld2RK+r64+9je60Nzqa9Toy
	hpUBCNuvN5o5qD95lGENdxNrxSW3xQ2F020AXI7kLxKa05RluylZLW8qwViu2Cmw
	a/dy4AOnP82zv/7vreEOLUOoNiGGLKCswuULVkWFulUyBXwgjSGSwFoTcV2WjNqy
	NknNKTUtbI24yU5yTyt7Q7oizMV66tEUmEA7AawGK7MSvvTUq3gTvojAM45cqz2u
	IyWHDQN3MPwbIk23t/PEjwFE5RoweEy17HzbM4GJ6xoySxvjkxDpJ2f3BjhLoqyC
	0cWm8A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg4882-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 03:44:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5473isbx032461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 03:44:54 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 20:44:53 -0700
Message-ID: <f450a1d4-204d-4d04-a34c-493af050893e@quicinc.com>
Date: Wed, 7 May 2025 11:44:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
To: G <gregoire.s93@live.fr>, <ath12k@lists.infradead.org>
References: <AS8P190MB120554CEB603837E6A45DD8587832@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
 <AS8P190MB1205E08229ACF7607841B4EC87832@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <AS8P190MB1205E08229ACF7607841B4EC87832@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kPYcFtgWO64Cb1Ao5w96GVHnzpZAtiHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAzMiBTYWx0ZWRfX/30/CtToF3XI
 mZAME4lYJUc3jQ+aX2dlR8rsfMsSVqgie5hqKDdyEGeBpV2o4lkcTGpsexVYCUBLj9uOpbo+tOI
 dqbTnSqhvz1Gh+LMWEpJDefW3OmCudZgS3wwoH6ancbvGqR5rZNZPq7m0DDvxtyeTJihMVO4eUZ
 xWMYEjh1YPcg2J1p+z2NtBblR//ShRAcivfFt0PmRVGGVQ5Oupx82Xrn2iodjivMd4KnHOjEeBP
 sDks0gJ2hKLtpcM6Nf78cNgBj6aqo0SE3ZaPzFCqhzH2YBXEDJTEcGA1M8kAHUXg5iMANtWxtwO
 p0kiYTEYN2NDTQ9r5yTuvBX3ZTpS3+WW0ibM6r0ZAH9m1FXi1I3MlwR8lj7cZmJxOISpQ18Ic27
 nPZGq+XIO6GbZjq3GRneejMQPDRTderBA061zzVBy2J6Dh1GSj2cJO5jWsAmyytDa+A7/CtD
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681ad737 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=jiBmnxg2u0YUcwRGiagA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kPYcFtgWO64Cb1Ao5w96GVHnzpZAtiHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=786 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_204456_515632_77027B03 
X-CRM114-Status: UNSURE (   4.48  )
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



On 4/30/2025 8:50 PM, G wrote:
> On linux 6.14.4. Maybe I also need ath-next. I don't know

so you are using the stable kernel, right? could you try the mainline kernel or the latest
ath tree?

https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/?h=main

> 


