Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A93C2BBCA
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 18:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rk+yFXt4mGCCDdJUJyZW67O7+a6gk3bTrwwiN30t4t0=; b=WK8OQhXK8j1Y7ffQgECUEYTurP
	URpIS+RMAE8S+2YVysRQn5f+o1WA1kQQjAubMwxATWtBJLB+sg1UrdSH4A//nxJw7AUr7ZH9zPEEg
	X8YieFhFBf58Xvj4YN7bK1RdK64LIc7AH3QnHjt6W89UOpV9bz9vrhhv3fyP0BlAm8wFH8luj9yVl
	aKdm2URZSiloQOm9rue84LJFxP+e/o7MZAFKniqtT4jYpU4FWl5tMfAVAXAafqJgZwECnfOQfCv0r
	o80PSgflMPr0qYdJVQgesn6MHWUfp7rjk7UEx5cqfFh3QagDxWnBdIlIRcINMkEOfGNJPnxT/peIg
	QKPBA/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMB96-000000048rf-0aqA
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 18:44:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMB92-000000048px-1xL6
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 18:43:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PI4Uj2018138;
	Tue, 25 Jun 2024 18:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rk+yFXt4mGCCDdJUJyZW67O7+a6gk3bTrwwiN30t4t0=; b=MmillfBiHy/0xzS5
	rFzSB/Ih62AQmVeO4Sei5Vsk4ro8rplxCYcqeb2pWN1hXOkKlG5336Z4X4LogEjN
	HmePGmXMx2ZiLfMTF/pGhMQus0Dqzh4iigqsBnhEylSq3dOT6nNi0H2oqgANR4mi
	u/zlwT3atlzkuqUEg0LLiyf+ayOhDL0BXiPX9FMYLT+CmM1fwLBX7NIkzIxoyxt6
	8h5j3psot9zLnBJd5zdn5ly7b/HfqFbvcwOwvpq8nnL9/0RPT8zUlAL0JNF77vyc
	fROLTl0eYk9oCnrzo2Oh9XUj0UOeLOvVhnW5Z3e+RiNhNK27+zyLUNJM8+xjn0Ym
	+knZpw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6qb8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:43:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PIhsLg032715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:43:54 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 11:43:53 -0700
Message-ID: <49516232-ef06-4ed7-9c51-b36d38e4a677@quicinc.com>
Date: Tue, 25 Jun 2024 11:43:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] wifi: ath12k: export ath12k_wmi_tlv_hdr for
 testmode
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
 <20240624095305.37189-3-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240624095305.37189-3-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tp1RXFfrDYwq-j9Ifit0cPvmdZCTYSD8
X-Proofpoint-ORIG-GUID: Tp1RXFfrDYwq-j9Ifit0cPvmdZCTYSD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=786 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_114356_678418_D14ECD85 
X-CRM114-Status: UNSURE (   6.99  )
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

On 6/24/2024 2:53 AM, Aaradhana Sahu wrote:
> Export ath12k_wmi_tlv_hdr() to further use in the testmode command
> processing.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


