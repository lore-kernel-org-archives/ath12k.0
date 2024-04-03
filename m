Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B46CD128A
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWDUWxBSYoimwLvgq0wf+wYP293NBJ4nq2WDYb/B9P4=; b=r2YiZ91ZMNb3rk/7jEgxV0I+7I
	fzMUSqB0nnuECmst4h8Ain27+oTb3fA7+0tT8p/EU5nnLRNcDB0xyQlR+psckcPPFl/pA+26rJmKG
	CWLgdU0QMD0VsUlLOl5Rq6SiSywGd/YcPWzzJHVQLZu1jjqMsV8gUaBd3uoQR6+eWQGvQG2SOgMQj
	SpQlDc13Gl1t0jLVU/8juO1aAvB0gnYot2KgUZR4RA8t7OgKjI4spv0wGcFQ6QZuWlVgZddbMznQe
	vHo8b3NNkO3PWF1zjJksn6dZjLpzH5sCYqEEdaiF3sEH9W5rZFpu2ntdi7rtMTvi2Xzm0I6NuMji4
	Zr2jz6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Ag-0000000HLcd-3VRW
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 18:17:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Ad-0000000HLb6-42Pb
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 18:17:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4338YN6L001154;
	Wed, 3 Apr 2024 18:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=TWDUWxBSYoimwLvgq0wf+wYP293NBJ4nq2WDYb/B9P4=; b=a5
	1MeFgMHhUaU2AUB/Z75kTFgLX730j20TEH1fy3BViRBrowxwu+lc8hueIOYLMOep
	sGHZTaYN5NFO1Cy1DUUzfWwkM+SbSu//Aa9W5n+cW/KabjTHmt/FfP51/el4pb8W
	n0ndYfnCL3IxlfZ8f4HKbYvfzKL+HO+qzij29v2fLsFSPaXoMi1d9SosTV0Yi6UT
	7jdjy9SDU8JSia/jMU7U5gp0NcKYWyoD0BukavGlU08CT/v2+mWeJf2nyfph5Yq1
	stGZhCf1rT9fC4TPOYExEJgWM7Oq5tR2kuIjy0GqfXPqE0HhVCx7R4J+Dmv3Yaur
	yz8GkcvIybAFwNaRKhbA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x93pw9fcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 18:17:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433IHA0C021097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 18:17:10 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 11:17:10 -0700
Message-ID: <4f12a0f1-cd66-4310-853b-f805b839950f@quicinc.com>
Date: Wed, 3 Apr 2024 11:17:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] wifi: ath12k: configure MBSSID parameters in AP mode
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
 <20240402210538.7308-6-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240402210538.7308-6-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QKDc43U2j9N1hOqC4xIqHgp_JrN8C29U
X-Proofpoint-ORIG-GUID: QKDc43U2j9N1hOqC4xIqHgp_JrN8C29U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_19,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxlogscore=750
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404030122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111712_385166_793DA47A 
X-CRM114-Status: UNSURE (   5.55  )
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
> Include MBSSID parameters in WMI vdev up operation.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



