Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD48C52D7C
	for <ath12k@archiver.kernel.org>; Tue, 13 Aug 2024 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZyl0ss7hN0dncjsV7SHeskTqvKebsx4Y75PnvEeqgY=; b=es8ObHHRpV7+g6cf6tFJNWS28E
	+PcFSYP97SDxv79xyVnJtncMdszqjgy3yqYYG+oX3sbQXv3nrNm2DNZ5xueH3jFrlkHkWfoZ9bqo4
	HKjGTg3t1w+J9sxzXZ4SHhvLCz9J4dNn20MQGvufdjAg9rb0KSky6C7VjocGohPHsofZ3UCXwt58w
	WWsZvj1S0qRkS20u/tpTv3bvfQ35jmuJnexBV2YhzNMSE7YW1kFlm3dRmnHJY2NzkafQxhIk5LCIP
	GcUgOg8rSmjGRD40GXuJahadMYv1WY2KNfrJXXr0pP+MYEN7NjE0zID1q4i06kn98m2sHhWbqYeDH
	tmH35Pmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdujS-00000004Q69-0wSO
	for ath12k@archiver.kernel.org;
	Tue, 13 Aug 2024 16:50:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdujO-00000004Q5T-3QcW
	for ath12k@lists.infradead.org;
	Tue, 13 Aug 2024 16:50:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D8XcEG026755;
	Tue, 13 Aug 2024 16:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZyl0ss7hN0dncjsV7SHeskTqvKebsx4Y75PnvEeqgY=; b=oIYqKGWYioHSQq13
	8bzPJTAgbjm2AUiUZx4EM0aT/q4C44qMZEBXObqBVcrnY/RvyaUPhWf5JoVQN72J
	6pzUXW9z5GbvpyAyjAUu1jeffsMj/h6WxsqOwmQ6EBSq9yeKsHAOhfNRsSKWDOhM
	sPsA26IMMNKMWGSnfHlE20LcFevHqnijLvhxxLsO/VGDmYeUJVppkEbAyvNJxS8G
	g2pmIPI/tEKA7FDyP9dBIIqKiHX+E3ZgsGkqOm+KRgLY61tgOVkhrTvzJlSoapnX
	DVH8dJ7afUovIMiHEmHHSR4E26CWRWC9zteRKe5Xv+JzFFdW5uBeWafbunLgqlWy
	8q+ysQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410437sq5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 16:50:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DGogiY008191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 16:50:42 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 09:50:42 -0700
Message-ID: <a56cc437-ace0-4121-93be-528d11c1f670@quicinc.com>
Date: Tue, 13 Aug 2024 09:50:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] wifi: ath12k: Add support for obtaining the buffer
 type ACPI function bitmap
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240809025055.6495-1-quic_lingbok@quicinc.com>
 <20240809025055.6495-2-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240809025055.6495-2-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nUQ9X8rmny5keBIgVsCKSfA7VQjlATX7
X-Proofpoint-GUID: nUQ9X8rmny5keBIgVsCKSfA7VQjlATX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxlogscore=629 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408130123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_095047_131866_4CDE257A 
X-CRM114-Status: UNSURE (   9.74  )
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

On 8/8/2024 7:50 PM, Lingbo Kong wrote:
> Currently, ath12k does not support obtaining the buffer type ACPI function
> bitmap.
> 
> To solve this issue, change the code to support obtaining the buffer type
> ACPI function bitmap.
> 
> This patch will not affect QCN9274, because only WCN7850 supports ACPI.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> ---
> v2:
> no change

I acked v1 and since there were no changes you should have carried forward my
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


