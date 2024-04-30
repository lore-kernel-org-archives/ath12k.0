Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ED5C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 19:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiA6yAP2ZH9bA23s6qYO+VlIsqhXzEKnRQSGeJeXGG8=; b=U/PszT+4eMBd3e5lAAaoPqjoXK
	ShErY317X0rJ+AQ+nP1bQJZlf0aq2UGPJaeMpZOFUjTMVa/shzElkSEj6xKoNSF18foK0v3DdNiHK
	ZYm+q4u9ot6iRdkfmoxT5bfTNEix3j0q8Yk4bVIa6k+2Fwy6+DrbYuGpTiWaK9fY+qmXvacbnqszg
	k3DiPlK6t3EFWzemyy3FTEtZTNwb2QxQ4B08tWt7bDI0S2s+Hr97+nG8IFPF5m4NQlq8PxezVUJSV
	nRlFPFeCXVHXyLugwKnCCTMniYdWwUeZ74UWDbauDBN84zawIoYJOnPwjvujNZSoaQfLxnGQrhfLY
	8A4X6mfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tHa-00000007k35-0ECQ
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 19:36:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tHU-00000007k2a-1LOG
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 19:36:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43UHSR4N024955;
	Tue, 30 Apr 2024 19:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=MiA6yAP2ZH9bA23s6qYO+VlIsqhXzEKnRQSGeJeXGG8=; b=Vy
	15H6Hm18jqWWxrcwv9oCmEjYd0Yyk5JjlnVpCOwYTRBE271ynaxpLN2moU93vxaz
	0KvR0qagb5c2lgGL0NL+7MUEaLvbCv3lH8QuEjeuLLyikR1+ZcEdM7Q9WKRlKr8r
	WEDSXfBV+IcwEg1j74CQ4ICbPyrxeXDDxFjbX/WJowix71PIj9/mhUbe4NEvkoSI
	DLNh0Ggyz8dNWC7X80JDk4r/LUdZ1xoyGXWi9zOpLzASSQTWAYTnHcm0hlWUjS6S
	0MdjFiDq0CWIbhsaughoTsoJg1ls4mZ6ycbtYtKE06qUSEDJXzLvXzZKbPHQuLzA
	oOiLxija3qhoClAWUNNQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xu19912gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 19:36:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UJajIE001529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 19:36:45 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 12:36:45 -0700
Message-ID: <d0549b85-bc6e-4732-9558-cc407c876b08@quicinc.com>
Date: Tue, 30 Apr 2024 12:36:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 2/3] wifi: ath12k: Remove unsupported tx monitor
 handling
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240430091414.2486196-1-quic_tamizhr@quicinc.com>
 <20240430091414.2486196-3-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240430091414.2486196-3-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ekG29wHsLL51jdL5aOqOVYzyRCXehKT5
X-Proofpoint-GUID: ekG29wHsLL51jdL5aOqOVYzyRCXehKT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=987
 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_123648_760464_7B52ABB0 
X-CRM114-Status: UNSURE (   6.96  )
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

On 4/30/2024 2:14 AM, Tamizh Chelvam Raja wrote:
> Currently tx monitor is not supported in driver.So remove

nit: add space after .
Kalle can fix this in pending if there isn't a re-spin

> the tx monitor ring configuration, allocation and handling.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


