Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B60C5478C
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzgJ05ceTZ+mmQ/d1ecGYIdk3UARvMSpKghtJDV9fTM=; b=kiDG8aehDWvsAG8v4gzsZEfrVn
	NcJ2wdkbQ6Zfwp2JmuYmwHnWf0it7Hr69bPuDi6h28lpr+8ebCiP0/euhndUVGO9TBuLZhT5ES/wJ
	wvs2Lzk+TeWYRT1+RP+MXw65AwABX64HdvSmeAeqg/ILlsl/8laB8jtKiP5w8COY1VzPYhkVBIRgT
	Xg0ebI6SwKsvxD0N6wzvSbpLT35tpMQywUrt6+mH0Gs7Xwf6zrEEyOVf6KM9qMsqVV+jqpMfXBTYP
	T1u2WUmjx31s9TQZde0lLB17oADOV0ca0ds3xUkDgNS+gLkKo197BO1Qrs89vT8VaxETOr4MmajSV
	j7WoKEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refyb-00000002E6O-0a5I
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 18:45:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refyX-00000002E2F-0aB2
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 18:45:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QF8LlO025416;
	Mon, 26 Feb 2024 18:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=pzgJ05ceTZ+mmQ/d1ecGYIdk3UARvMSpKghtJDV9fTM=; b=SN
	k8oGBzZSViyhj+k5xCzYCemJeIe8qeHKuDiLpML8A63ZYRJ1ARjhziOu2QSa6bLe
	XQ9evJSMD0AekCoT7Z7+3bZfYpwqXLaSPt4WCxdcAdtebnDp90WbuZUDh6ls4H1a
	pPM3o8Fw/v+9tVEJ7wm+cQ7FIAfym25HkwhbRcjYQJ73z7Nu1RTDCifK5l2l5bl9
	98zW6rhurgFKgKmZBxt79U66YydOh0EtXC3+EoudJzMoq3xex963CDQzd1JfVkOA
	dmH/IxN3JFIzJoeYD7zVae0O3V6ITmmCa43g9N+KECWCqQHlBYPO9pIS/0xvF2xC
	uYeBYiVnIVsXaHZ81d1Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxnht4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:45:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QIjAGa012406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:45:10 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 10:45:10 -0800
Message-ID: <987c8f9d-ca21-41c6-b7f0-5c66a636ddfc@quicinc.com>
Date: Mon, 26 Feb 2024 10:45:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: Refactor error handler of Rxdma
 replenish
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
 <20240226162310.629162-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240226162310.629162-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MssdKHtk5_O4MDlNSZ-g48ZNqAeYWbJG
X-Proofpoint-GUID: MssdKHtk5_O4MDlNSZ-g48ZNqAeYWbJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=642 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_104517_670766_D8201337 
X-CRM114-Status: UNSURE (   7.72  )
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

On 2/26/2024 8:23 AM, Karthikeyan Periyasamy wrote:
> The Rxdma replenish handler currently contains redundant code in both the
> success and error cases. To avoid the redundant code, implement a
> conditional jump mechanism by placing a goto statement to prevent
> unnecessary execution of the error handling code when the operation is
> successful. This change streamline the code readability and enhance its
> efficiency.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


