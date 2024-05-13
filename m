Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9FDC25B78
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 23:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6YShh0aQ68sFU57JRqaHZGjliu20f7Nh9BZfELiT+g=; b=3BXXLZmzOJdUfYFnt7PpuZhDJe
	0BS2+gtuZoalRI6waW1h1jO3InoIw772fmaEz0RR7JOOODKnp8uCEs7vzH6DXtAcv8VHlGctN9Nps
	zWAGkbs2p3dZ8eHrrvxORt1waeBiSYOu6cH0pT1hyH757v3Dh4Cvqnk2hlzmkEMl66Z1NiLceuJlj
	9lIFH6F6C+nyOd7PSKC6UQXjWnZ5+2EOKAktVmn+1/aK5Q8RV6YzUzEF+T1yeb81EsXzn8kSEjRxC
	dQY3Pxt8G2MAjr2N9CqUtRYr6TgU/Zot3h4I1Sw5EY/wesw/IXd1wS44hHTKGGa28SedXJLapw0Nk
	OhZttY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6f5e-0000000EVDU-4A4p
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 23:28:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6f5Y-0000000EVCP-3P11
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 23:28:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8X6r001604;
	Mon, 13 May 2024 23:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=u6YShh0aQ68sFU57JRqaHZGjliu20f7Nh9BZfELiT+g=; b=oE
	eYz8DUbVnCg1SkdbKuwM/YYTiXfGrxsyKJ/vOcDVIW0/djBovmCKCA5wNH4eZriX
	nsH4jPRC/qd3RGEckRbP6vnL95W6s69f4XGt74JdK7550SrWVuRDUGbmSiPr1+pN
	WH83bJTQtvAwaHFTED00yxBXanX78xvzgcgpu/7v+5BZd7bRLj2cdpgidla1Bs6h
	urYC7i7ANaAaHLE0BwI0F/BqUX2iAZEgXiLW/Q4HvkqaQZjhd8HV39sCWVZ+wxJU
	5pd1hHXp5eUElsUfEGss0TscF4M3Bt8RsziKqPrpgd+vtdR1wO52uzc9wieSM9jD
	in6v8S+wdIixdaeiHeOw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21uhcn6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 23:28:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DNSAX8009402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 23:28:10 GMT
Received: from [10.110.0.4] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 16:28:09 -0700
Message-ID: <31dcf319-8a3e-4128-93b1-17b3f900ce81@quicinc.com>
Date: Mon, 13 May 2024 16:28:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: remove duplicate definition of
 MAX_RADIOS
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240511013644.3103905-1-quic_periyasa@quicinc.com>
 <20240511013644.3103905-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240511013644.3103905-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B5EvIpy4VSZkZwkD8cEOmNQbdIwu5FJl
X-Proofpoint-GUID: B5EvIpy4VSZkZwkD8cEOmNQbdIwu5FJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=761 impostorscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_162812_931658_52F0BC34 
X-CRM114-Status: UNSURE (   5.50  )
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

On 5/10/2024 6:36 PM, Karthikeyan Periyasamy wrote:
> Remove the duplicate definition of MAX_RADIOS from the core header file.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


