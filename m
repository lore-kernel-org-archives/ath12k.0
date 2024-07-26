Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733A6C3DA70
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 00:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cG9KWa1wdQLaC5sCJvbaWfturi+BCPkIuJYi/Z9JCx8=; b=UyWG9gsgApaFqGHzTaZz5cXegr
	qgMGq8RbY+w/skid+ilI4KeCo+ieesr+dsYoIsS83/cXiW0TezHokELCzt27vCvamCu156Rhi6Guq
	oaBYpxzSLYyBU/LAJuMmHk+XodoIVntAnWN+RIhIBWOHrX0GUN7JsLU491c6GlRnTvtXTy3K9rJ8z
	pRQFoyWSXMAlIEJxhlYENhHdrnm5TkVkxGE65Ka3TVp+CmXnIRG2Z98UrzPss6ECqTWsrX94GjMw1
	AqmlmaXgfo08OpAxxtdDQOKA6s+1AiqOa/EvmXUJOe4aPS/HURYJwZ1Lu7oieesJ5BzdR+czsgE2A
	PXkaL1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8eh-00000002V7b-0iBs
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 00:17:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8ee-00000002V6q-0baF
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 00:17:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PIT9vF009618;
	Fri, 26 Jul 2024 00:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cG9KWa1wdQLaC5sCJvbaWfturi+BCPkIuJYi/Z9JCx8=; b=eCKR4QwcVTw3Sm4u
	MRoBPy5IWJxdFO7emOD/XTYMhOLftJhfu/zAtoQG97gzBz4gJlWapNsyJ00xiTHR
	fI9xOBOEG6r26hj6z5eLtb892r54Bp0UVbGeEAmMZK8GYKPgIfvXZECBMYze9rvX
	OfoYItLcjcqG/tDczXAGTUtOyCMxF35qSuY7aJaeafDykvGhAS8F1iZ91OsZgUc/
	3d1We58ShBjxvsJ9gXUvGTqt97YkRazF8sOVFNAwW1BW2vnTST6CXwe7vOo+AcLB
	SWN42fEgzsLFf/9qafIVUYwWlmW5BMSYQqlij7w7ZESXb4ioIDqUQiNCrywJyFvh
	IrNOvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xepnsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:17:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q0HoZE031071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:17:50 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 17:17:50 -0700
Message-ID: <aa2b6791-9d18-479b-a80d-722b99592cb8@quicinc.com>
Date: Thu, 25 Jul 2024 17:17:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] wifi: ath12k: fix struct hal_rx_ppdu_start
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-5-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-5-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8b83TGouQIE3PiZEexulhNdkTd8HQUPJ
X-Proofpoint-ORIG-GUID: 8b83TGouQIE3PiZEexulhNdkTd8HQUPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_26,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=564 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_171752_223426_8D7EC979 
X-CRM114-Status: UNSURE (   7.26  )
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
> Current struct hal_rx_ppdu_start in hal_rx.h is not matched with
> hardware descriptor definition.
> 
> So update this structure and related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>


