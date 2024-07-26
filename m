Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B58C3DA70
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 00:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6lsHdF3AwD26eYbzzZNUhaMjwpjs6pvX9XRdkk2b5g=; b=U7lmF01pmNadUQstiR3nZ9XSZ2
	DMjEKbQnnjzFpuqh2sJJO+lOBR9gGqX7zXyhfWL54xrdIvIB0vn07gaZgb9f5ELzAent3HL5M8cax
	De3VVuUOriufV77/8Jg68iWup1q/VIQ6abkqH69yObJ3/ONMjv+OsHMa1uO8OUpcJbmrldB7YijDA
	jcbLID3j+ub5Q2tp0nwBO0+ZJxtRa+w33OjxUuNxdbE7a9bZ5K12uJ+AwHHQIlgfq0xeM1k+IrN3q
	Ye6TIWmWpdUseD0vIHVDGboZxDGh3d0asTiUumYzYewMFGLcV57rV/sfRICKlE+ItXICFaPDIK+W+
	jFzMl+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8el-00000002V9m-0yz8
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 00:17:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8eh-00000002V8B-30D5
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 00:17:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PMAcKY010673;
	Fri, 26 Jul 2024 00:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6lsHdF3AwD26eYbzzZNUhaMjwpjs6pvX9XRdkk2b5g=; b=XYyEO2QsTdFRNYEx
	xraVdq+Kh2mM3j5GSxrhBUehEFdUaeLIdXewDLaSdiom/WTRPXl3sGhjq+qiFgsV
	4pLhmvnQSpcpSqtVh+lisuOQovPH8uXOdpZayLn4m5e9gO6Vcj1S4uRExaIqfSoM
	DbimAXRKIfqRLgCd2JedeyK2V95oZZeAsOzsUYvUzhJv+0KuQ6uaxxUISeUDHhAd
	yg3XKKYFyJhTNF8vj3/5KK+RxI1pB0WANqSRpXk7Q++WhfQDQ/qArxA1wCBs+Z+U
	cTWjC2bVsXVQorx0EFkbNUj2lEe3H4P5jkTRCbAk1TgOiy53b2S4FQbn7CqsU3At
	5s0s2w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xepnsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:17:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q0HsB4016830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:17:54 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 17:17:54 -0700
Message-ID: <fb12103f-e7b4-4628-aeaf-3b9f99e09717@quicinc.com>
Date: Thu, 25 Jul 2024 17:17:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] wifi: ath12k: fix struct hal_rx_mpdu_start
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-7-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-7-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x4D7YwnKz2iKn9p2XyJ13W73fuRgYfXl
X-Proofpoint-ORIG-GUID: x4D7YwnKz2iKn9p2XyJ13W73fuRgYfXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_26,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=564 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_171756_071780_48E8005F 
X-CRM114-Status: UNSURE (   7.45  )
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

On 7/25/2024 5:00 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> Current struct hal_rx_mpdu_start in hal_rx.h is not matched with
> hardware descriptor definition.
> 
> So update this structure and related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>



