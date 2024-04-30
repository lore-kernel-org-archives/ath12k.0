Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D20C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 01:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S65OKwt03GW8q6tBhu7FpB2E3mI/MiYxkJw7BFtHBrc=; b=G0RGGn1FuLn3w2/VifhmwOIopI
	vke1qYGQPyyKWrlNYmymQ9CZhTAfwIdnfaKgkFH9zBU4TDMRCPwSYy1nNMqwFZbTIpBNs8Y0Yb4Rn
	ZacnQQ+kgOd3owGwTPI/si9OJzICmJF7dofBfw67rIh5ZTQ6bUQVXDAdJDn56ZiyfB6LjdhBqO/QK
	/5XJHe/6MBJAkE3Tm0fSSuORjNem40YB61pow2zugwOSlJ2kd5jhICvyLua2FhchglsZKMYj/DKwD
	g8aVatMnn9TqIKBSox0swZb1WZ27SDG+i4zLFdfzH/Ko27NSV3uBOrE1isRzhRjWU24pElRh3uA3G
	crvlNz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ccx-00000004jC4-111p
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 01:49:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ccs-00000004jBb-3xm3
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 01:49:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43TNw9jt007582;
	Tue, 30 Apr 2024 01:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=S65OKwt03GW8q6tBhu7FpB2E3mI/MiYxkJw7BFtHBrc=; b=ZX
	4Q9eM6IvLIuB+6qwrgIy1FHwo4v5BAlkBFvM75eSmP1kBQS5O5U8jqNRVOIk932z
	AEzeo0LO5BwHCdmoDVF1+vJVXOVm8R5zVCfLu4cDTNxG4cKYaxDgRPLykxwhMd1q
	ZxPXpOJzmlldhLJznrC/aRuDqkKMXslB4JvTOd4qIkiXSxjeUDxCZA8Wo1mKmV2c
	AUMI8ZyQO0bNPW+dKXNupNszVyF6TeDjZ3pa9b01sYLBFoULJ2Z2Jh13YjjYX+QU
	HHAei1J9MI6AVCVNKk4mLIEFQt0nucmwTYdc5a2w9X9a7pzcIxQ/q1+A21WZ5O3c
	2jGEaWai7a4v6N2dMrMQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtg51srxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:49:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U1nidi016287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:49:44 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 18:49:44 -0700
Message-ID: <599a634f-304c-4d5c-a5db-601e9b366fcb@quicinc.com>
Date: Mon, 29 Apr 2024 18:49:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] wifi: ath12k: remove unused variable monitor_flags
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240429081525.983-1-quic_kangyang@quicinc.com>
 <20240429081525.983-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240429081525.983-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HCNT1A2G0FpUAnPjnInuplbI6Gg2By69
X-Proofpoint-ORIG-GUID: HCNT1A2G0FpUAnPjnInuplbI6Gg2By69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_22,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 mlxlogscore=704 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_184947_023593_C9CE79DD 
X-CRM114-Status: UNSURE (   9.13  )
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

On 4/29/2024 1:15 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> monitor_flags is defined in struct ath12k. Although it is changed in
> some places, but it is not actually used.
> 
> So remove related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


