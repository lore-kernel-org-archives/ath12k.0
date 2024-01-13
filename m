Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE07C3DA79
	for <ath12k@archiver.kernel.org>; Sat, 13 Jan 2024 02:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VhVWGgljXxc0H1jSIaStN195QuTMWzD+Pmkz7dpkPw=; b=Et8cI9VY/+GvXxtRbXOnLzed1q
	PKh1n2ckFvuP9p5qVppsxPPsBkj29QyXgEJl4W2oWfA/PFoH4+x+5AvLOV+1LEXQ20CREv0H241Dh
	xOewLsCW2fnvzgY8DxRGintm6XRQzIawfGJCNJWlSvxMuKRuqr/Ho17+hGN5HcVziVtjDoerhvJS3
	9pHx5zUc/ipPuR2KE0nQ81wHPrk2a2w09CIx1I5rmp9UoBy31T9IkiqJnzxoMauCqISQejL2EUqwI
	STBo2gTSjSVyxc5P472Iafqh5MG9IcopOMjt+//pZirHl8fkkJh1jPY/2WXj330ajrx3+yCVtJ/J8
	kR20wS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOTQI-004Qql-08
	for ath12k@archiver.kernel.org;
	Sat, 13 Jan 2024 02:06:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOTQE-004QqO-30
	for ath12k@lists.infradead.org;
	Sat, 13 Jan 2024 02:06:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40D1H5vb006520;
	Sat, 13 Jan 2024 02:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=4VhVWGgljXxc0H1jSIaStN195QuTMWzD+Pmkz7dpkPw=; b=Ty
	lPEFzEQ33Og5SaMqOlSgCXmV2k6QGffPD2Gu4wKVDoSDMHyxpHobtjaoPxt5a7Em
	LYjSbsAQRQLePcQvDzMjWlSdZMAOlZxCilVnp7u4MlUzPerBElpe89pPBQ2ok6Jr
	CVTsFSHOpmOC2DPOF80QnRt4LgupQxhinAA7OBHPKQ0YtM+OMqaqRiHIo/PWwfJw
	Nf4nnva15wbTb3q8IWUy41JMgfQOoYvT4Uuoc1FcX8WHs+38H3Ldzv005GY6B8vQ
	JQY2+fbY0IIsw0Cmgq02mXAW4H5nwsB2z7PfLb1p3fJkGGTtBmJVdAiQGOFBs+U9
	++WMX72Uw6VHqvlZfiIA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk43xhs7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 02:06:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40D26q49017001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 02:06:52 GMT
Received: from [10.110.118.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 18:06:52 -0800
Message-ID: <e2be61a0-a19d-46b0-959e-c4cd1f9de3ef@quicinc.com>
Date: Fri, 12 Jan 2024 18:06:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Refactor QMI MLO host capability helper
 function
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240113001659.1022465-1-quic_periyasa@quicinc.com>
 <20240113001659.1022465-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240113001659.1022465-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5wKX9LXj38rawBndRpPTLt8kkWRWmW9C
X-Proofpoint-GUID: 5wKX9LXj38rawBndRpPTLt8kkWRWmW9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=837 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401130015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_180655_092881_28E342F0 
X-CRM114-Status: UNSURE (   6.76  )
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

On 1/12/2024 4:16 PM, Karthikeyan Periyasamy wrote:
> Currently, QMI MLO host capability parameters are specific to the WCN7850
> platform. To make use of this helper function across all the platforms,
> move the platform specific MLO capability parameter to the HW param
> configuration.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



