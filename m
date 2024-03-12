Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69E1C54E58
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 23:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cotIPoucwE701AUg342mTXNZJnAldQtZmWJn35Mt/fQ=; b=iQEQBPsR0S9Jc0YPIejLdTByah
	TWNlM9KWZqGvPGirdMfG7zDfzuMH0/g6rU6huczMqvGt07GQJfOTd7ql/0XGBqGtZleq6eheuGdLo
	l09ovbErBLYeJxVRTUFjL6HEwDLYGhg+ImkcM1lo1MWsWVuNnXsHSSbQkW7OyWdkvI0vpy7EWfANQ
	u1nx8PHDgd9QOmIFT8XsB0+LCrD4tHS1CeTxbTXdUNKa6zhqjZgug0ksf5/PIxywHQm2X8GdfcET1
	Q2BoZzgDbKE13Vm6/pbGaFfAcdtmHqUe4XrejV2JlKBtzLUJydjXK13tdeHCUc3cnhs6vjGtNh9tN
	NbVL691g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBOf-00000007xcB-2a1R
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 23:19:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBOc-00000007xbV-119u
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 23:18:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CN12ZM013998;
	Tue, 12 Mar 2024 23:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cotIPoucwE701AUg342mTXNZJnAldQtZmWJn35Mt/fQ=; b=K+
	h6scNagFrehwp3Om2cpSBQ1HrEshfkv1wV3h9a1KBxQZJUTD1LV1dMmHdpCh4+rI
	2gyy1gXcK+lSOu/wlsTcMU2VE6R88afDpak9zX1Z33jKgwvgoolgctLpd/vJPtZt
	IZ+DjdhVmUdN6wARJB+PjvQIURoGSkTCl6jUlVOeuT42POoQXaSPHmVk5LSMJDAh
	DKWqha+SFJJ8zRuTCSWYHfenTgsYcAFlfnb7kTz5LwrdhaFRMzo1APSFq5zB9/Rf
	lYazqH4uGF+1YErQyeOqCqe0kT4lH5Afw/gqBblBQ8BNRPPGLeOiVYS+Y7+Ogm5T
	Ppr0HiU3zVegscVT0m2Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtw4frh0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 23:18:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CNIt7h009482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 23:18:55 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 16:18:55 -0700
Message-ID: <57a85337-d0ef-4855-b512-88d49cedff7b@quicinc.com>
Date: Tue, 12 Mar 2024 16:18:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] wifi: ath12k: Modify set and get antenna mac ops
 for single wiphy
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-11-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240312135557.1778379-11-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dkMAQ9divMMA7uTtQAMiroQV-g9ofPAv
X-Proofpoint-ORIG-GUID: dkMAQ9divMMA7uTtQAMiroQV-g9ofPAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_14,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=849
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403120179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_161858_452317_6F628957 
X-CRM114-Status: GOOD (  10.63  )
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

On 3/12/2024 6:55 AM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> As multiple radios are combined into a single wiphy, and
> the current infrastructure supports only set/get antenna
> for the wiphy, the max Tx/Rx antenna capability is advertised
> during wiphy register.
> Hence, When antenna set/get is received we adjust the set/get
> based on max radio capability and set/get antenna accordingly.
> 
> Multi radio capability needs to introduced with interface
> combination changes to support single wiphy model in cfg80211
> which would help extend the wiphy specific get/set configs similar
> to this to per hw level.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


