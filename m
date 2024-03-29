Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71580C6FD1F
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dr/p/SBFDRBlZfBqMJFfIe3aS5XOZ9GBwJ9t/vr2iK8=; b=KSWFcEOBXGYeqKSVbFpUPIqtuk
	o47htgA6r1x4SKnp9K9Ez9hefBDKEvbFoc1NraR94R48ZQQR8LqOJA84v9j/tJVRd2BWMxdL94m6L
	TEgZujFbhkSp6GHTxCCMXjrw8RV5RrswWaeHORp+y+6ftt8oHSffB6Jbd1R6+CIFtIemzhe7JW3HC
	9AWfZUnWe3MhtIGzkywHwxtm4ppLHZg5/db2rwCZ4QQvN1FX8v/LjNndHu7tDQevyv/pdbKKXXXca
	2JEWSf56Lm360mdJKdI4tQWiYONBHRstOu9wzVwpSCjEU5hYvVlRqMafg+4hA6gqFojzpzkeMA7Sq
	JBK3Dv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGmU-00000001aIC-0hhF
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 18:16:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGmR-00000001aHl-1keK
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 18:16:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42THseLB010407;
	Fri, 29 Mar 2024 18:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=dr/p/SBFDRBlZfBqMJFfIe3aS5XOZ9GBwJ9t/vr2iK8=; b=NZ
	3RdQ46Eo1/pnsx1dl+0Gjzq8WU52evEpC+VOK/S2GImphDIIvGZ0RLP1ag3/q8mY
	IjrNyPe7Mtv6d+GTkOUlKZamgPE8TpV9GDWFgBm2HHoSAQqTmO4/fMsWw231n1cD
	pwFIIbZ5lA5T5m4a8tTMUHbUVG0Bb3RLkjPNA+xZkJjCV/8zSo+bhhBD2D75QQmk
	tq5jhpJxhEwodg1ok+RqsBiNMem8heIjCBf/LB0Jxt3fKSE5KyHcZnFqOta99hQe
	LYgs0HVSNtTah6OFaF99TUN42DLM2dnkAAXjGK55jho4viKHzENl9+/ev6+8ovpg
	wEfpLlS1n3IhGLn5ZKcw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5xcy0kvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 18:16:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TIGgFD029432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 18:16:42 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 11:16:41 -0700
Message-ID: <f24ad7c3-85a4-4b92-87e3-75b45802ce27@quicinc.com>
Date: Fri, 29 Mar 2024 11:16:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] wifi: ath12k: Correct 6 GHz frequency value in rx
 status
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240329173926.17741-1-quic_pradeepc@quicinc.com>
 <20240329173926.17741-3-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240329173926.17741-3-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tqfWtZovy9fbqkeir2Rc-IYGT8UUH_iX
X-Proofpoint-ORIG-GUID: tqfWtZovy9fbqkeir2Rc-IYGT8UUH_iX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=779 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_111643_501905_5FB6C6DF 
X-CRM114-Status: UNSURE (   8.23  )
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

On 3/29/2024 10:39 AM, Pradeep Kumar Chitrapu wrote:
> The frequency in the rx status is currently being filled
> incorrectly for the 6 GHz band. The channel number received is
> invalid in this case, resulting in packet drops. Fix this
> issue by correcting the frequency calculation.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


