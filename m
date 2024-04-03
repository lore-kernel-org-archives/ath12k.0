Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A32CD128A
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 18:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7oMtTy+fMWt/T6Jsy0xtxrd5aOIVO8wJk8+6lcvZxc=; b=qYewkNa7aq0zf+y2yT8g1PrZDt
	poD4yvdZotyJGn70+ilsHEz5DbDj+J/Ss1Yf1NlHC54MOkKsE2S0cCkYEJxJlIIw3sLEPKE/6Ft3z
	kfdR2N2yoIDwVc89S+WNqEMPI6CDp5QZ8SWN74ryV09eCHwWruyjVAfUsthsdzw4bVx1ZeaCd0ust
	XYoeSN25SmT/39CgRwLDGBNoY7qndatlL0eeib2FeooOOHDeJg0YterzbJwNVnDlGsYBfRCboF9uy
	20bbJ6IPjgX4Zm42XNUmQbW3KtvEEU7X/T50hHFrkLUXuDbQ9U/nWqzEbXiNfC6HnwIe0wFTQ3l3n
	NXBA9D5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Am-0000000HLf7-29lM
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 18:17:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Ai-0000000HLdQ-3E8M
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 18:17:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433AtDQ7023560;
	Wed, 3 Apr 2024 18:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=O7oMtTy+fMWt/T6Jsy0xtxrd5aOIVO8wJk8+6lcvZxc=; b=Eb
	Ql8Uk1RE67toY28Y9+l7b3U8eflT06za90+CqaM3SZVe4rsnlxFbuEtO//SedegJ
	TX4zCAHEkOAG+7TJirCrAAzgPmaZhESzL8yHmn2edb5N+R7WjOyoffUnaayhGYzI
	DASqas+dkT/LioYRfj/5STZRA/ow1J8AsTNWa7L1iR8YS1FInPvrPeBsReBBpvEI
	ACQ5eWf9yxkAfYDyzbSQnLBTIKsyhC9Keh97XvXC6ugqwSDsCXpuKsunk2nLVCSa
	depW8c4un2uaeRqkdQi6oZ/zfOvEeXYxw0sv6SH+R7rIEnrgFtrpnV6Iev1uMdSZ
	aknMdwGHEtiVz/qq60WA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x93u59f25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 18:17:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433IHEkY030150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 18:17:14 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 11:17:14 -0700
Message-ID: <75e2d784-f91a-407a-bfaf-abf6bc39d0c7@quicinc.com>
Date: Wed, 3 Apr 2024 11:17:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] wifi: ath12k: refactor arvif security parameter
 configuration
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
 <20240402210538.7308-7-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240402210538.7308-7-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NrFcf12KQhnDTB13lYrOPHvp3MhAzuPy
X-Proofpoint-ORIG-GUID: NrFcf12KQhnDTB13lYrOPHvp3MhAzuPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_19,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=804
 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111717_153645_96AF1E6D 
X-CRM114-Status: UNSURE (   6.57  )
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

On 4/2/2024 2:05 PM, Aloka Dixit wrote:
> Configure security parameters in a separate function to make it
> easier to support setting the same for nontransmitted profiles.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



