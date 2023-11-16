Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E293C54E76
	for <ath12k@archiver.kernel.org>; Thu, 16 Nov 2023 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hs6vjxQrUqNq7dBC8RNbfIUF3/r0qj+/MSW/CJC7E9A=; b=jGPURVhmjjC9UF
	M583LmTFA2jsh1ocei+WlFGHXIcjEYx84xUABnAMEUJACGq5t5eR18xILKN1z9fR707klRo1OQ/+9
	hUanLR+LABO/qV9Ufbpr6urv3vCirbVhNfO1zGLt/FXznCpKgbLg0VFqcAdy5BwukUSzf7NpUHJ0d
	1tHpGZzIp30sqZzXzqNtpcUjJyz5rpS76Mek2PSmKCR39La0kts9LcXBlu3hTnTbsMev/xtlgYQuq
	NXP0GNAnrM9CzXeUHXbqAWO2A2v9PyI3tT1Ag74Ovz420BtHchZgc1V32F7zNylJzS5LIB9HfadRY
	MSQoqqg1jX6VGvcBsPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ku4-0054Xj-2E
	for ath12k@archiver.kernel.org;
	Thu, 16 Nov 2023 22:32:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ku1-0054Vm-00
	for ath12k@lists.infradead.org;
	Thu, 16 Nov 2023 22:32:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AGLs2ZU001580;
	Thu, 16 Nov 2023 22:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3lnBg0GqK1GXRqDKIQuCedQmoQacV7visCy0LvD1udo=;
 b=OdYdlYiOJ8l+ZiEiEC96potxFicw8pkhq7ZiUJ5oBMwpbJn9+Izj9RuyqYjevWEJfshN
 KVjQU6dTfoi8KqitwgxdlM3m4qH/pUjWoGyea+sFwjJvjEsmfrIJqAzdicfBaoXw2sBQ
 oF8qf5kC99nKhZUbxp9DuBjmVchyyjSKeEHw/4gR516Amzq9rDoq+sU+zXiIAUBHhJec
 ZAcIgtIVvT41COH170hc+QvsV/+LOhCpisUZqodmsLhSSU4hx4CXtQvCfipy4iT80bak
 O/fXp85cGsadfQ17PKGR3hxGae9n1JPHLB3ynhxpmM1BAPIcaYoff6cogHkK0IrZg4kk zQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udkkusbbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 22:31:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGMVb8d007563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 22:31:37 GMT
Received: from [10.110.1.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 14:31:36 -0800
Message-ID: <a7ae4efe-08be-4b92-8a0e-4f1e743852f1@quicinc.com>
Date: Thu, 16 Nov 2023 14:31:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: add 320 MHz bandwidth enums
Content-Language: en-US
To: Muna Sinada <quic_msinada@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231116221839.1303170-1-quic_msinada@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231116221839.1303170-1-quic_msinada@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JAveaeJmosKXS2yyZOGbEP_iHURIP-_p
X-Proofpoint-ORIG-GUID: JAveaeJmosKXS2yyZOGbEP_iHURIP-_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_23,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=771 clxscore=1015 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_143201_155822_06FFEC0E 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/16/2023 2:18 PM, Muna Sinada wrote:
> Add 320 MHz bandwidth as a new bandwidth enum for ATH12k driver. This
> is extending existing bandwidth related enums to include 320 MHz. This
> is a precursor to supporting 320 MHz in the future.
> 
> Sanity test performed to confirm that there was no impact in existing
> bandwidths.
> 
> Additionally update QuIC copyright to include 2023 in hal_rx.h.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
