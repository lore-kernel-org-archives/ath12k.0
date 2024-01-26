Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E342FC47DDB
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqdyPrn/JdAnj8YX7PnHtZen28/a1siiw/QSDu52HvU=; b=uCasjdPuTABXa00xF1WVc5386H
	pcJTAqzYZ4C1i7vqWTHLfN56heRKApYbJMATlMuYgtr+VwGbXJgsL4nSKy9AFGwnPcSpHCI0+8hiv
	ZhjWB1byvRXj4gd77vXWKrdeec1WMZCD8lUEjL4bwBgQ98Q/pmd7Hc9LULJvZ3G1TAnWEvhoRxEFC
	gSElCV8hxUg4BvlEtLYyUMXFnS1HWagMxVMqVKccev8cavTcRq3LSxAsM2TH8Vq/smNYdbxTQVgX1
	sCnVhcUF+vh4d76UbDO/BLTQLsIHH57lME2UVTZ/oi4g7rirLK+t2jFHNQyAdq5FROtt6q7IPqj11
	Qym5Z8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTQrj-000000053Sb-2bKj
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 18:23:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTQrg-000000053Ri-2h1w
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 18:23:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QIFoK2005792;
	Fri, 26 Jan 2024 18:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wqdyPrn/JdAnj8YX7PnHtZen28/a1siiw/QSDu52HvU=; b=Xj
	pzQyjmGTbmOJA3K8tOPp4GV0PIFCQlm4X0XCoclv6y2YBCxyUGq9uGg38KE0GJTq
	SyVp2qyZeEuY+gS5qdXT5tCJhHmEgyMpdJWKb2p5CRTWkATlJyFjmkdHZU7h4trO
	9xLkwqOX41bNokY9o08Utw6pUdECC6UpQA2VBq8aK+zw5jTy3HcI6qc5Y9IB52Pk
	2chHFD/DQzZIat0rTqBoqE/wp1Xv5+TCC08jGJADyIHTu0H6QEtOmDNlpR9uZP8c
	DQDLBDgUiwsW9NPsK3XUzyRrgBpCUGVx46tiQWoItnsFud3DPVsD6DmNgFN8XeON
	cgUxWUqy2U6UtrPK6eYQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvgp2g6xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 18:23:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QINgMJ010837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 18:23:42 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 10:23:41 -0800
Message-ID: <bf9e79e9-2b49-48dc-984e-b6e9e6723f5f@quicinc.com>
Date: Fri, 26 Jan 2024 10:23:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] wifi: ath12k: fix incorrect logic of calculating
 vdev_stats_id
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-11-quic_kangyang@quicinc.com>
 <0dd4948b-e967-4562-b98e-2f4643205ca4@quicinc.com>
In-Reply-To: <0dd4948b-e967-4562-b98e-2f4643205ca4@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uTQOuBcx0KoVJvdtO3maGNjvNIPuNeDE
X-Proofpoint-ORIG-GUID: uTQOuBcx0KoVJvdtO3maGNjvNIPuNeDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_102344_772609_7EE57D37 
X-CRM114-Status: GOOD (  11.51  )
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

On 1/26/2024 8:56 AM, Jeff Johnson wrote:
> but why isn't this instead using ATH12K_MAX_VDEV_STATS_ID (which is
> currently unused)
> 
> But even the current value for that seems wrong based upon the firmware
> documentation:
>     /**
>      * vdev_stats_id indicates the ID for the REO Rx stats collection
>      * For Beryllium: 0-47 is the valid range and >=48 is invalid
>      * This vdev_stats_id field should be ignored unless the
>      * vdev_stats_id_valid field is non-zero.
>      */

After sending this I realized the value of ATH12K_MAX_VDEV_STATS_ID is
correct, and IMO should be used by the current logic. Use of hex in the
macro vs decimal in the firmware documentation confused me...


