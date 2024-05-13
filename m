Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4EAC25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKdmqxz85k9JdzbtUW6kpgKo45dXfF1+JZxJi+PA2Xc=; b=Hdbaw1E8PRcMBhXMp4Azy1TMGl
	h7Qfrlu++QOX2J/0s9Z3MNkNpJ1beyxCOoae4DTBzI4Us03IgfHmjinfCHLBaluzYfJbFaepFzJpQ
	HjcGDH7dHGV7lQ0HT/bvqlVc7A9lOK1Gd7ATGb7GcJMrvNDvzDHmmvWIItqTfg2mML7bMsKMMDq2a
	l3+D82bV4zj/67rq9sh461Rl73brW1lg6ThrP9t7Em8tcHUzCV6kTPEgqM3ivS7g7lx5UGSxaVn3r
	DUy2nVJiwsJyIivRusF2WDTe0JXEcRHRNXZpWuUNhUXRrDd6ievDckbIvKQPA0HKpLqWEEE4W0pjI
	frYarhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ceu-0000000EAoG-3HcI
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:52:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ces-0000000EAnR-2FWt
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:52:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8vrl003187;
	Mon, 13 May 2024 20:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CKdmqxz85k9JdzbtUW6kpgKo45dXfF1+JZxJi+PA2Xc=; b=FO
	vgl8saMkDzauv8CpjkouEBSAlyBTdalSz0NnRISOt2ASkmDmlb9iwgdFbVnLBiRQ
	7mD+ywZt4eklYG/7ij+rVCRcC+kXLccjR/enAOWTQ8KJCErteWEZry6GfOwee181
	r6HwYbCDGiSFsyUW6c4lOXm709AApM2nhjPknkrvJySQyihlAvnJdbfRPum5mbRx
	1MaqGCnu9huJWWatwVALLX0N6TvLRvpDiuwDJDCtXToBVaJS5SW3tM0oIV1JcFLL
	wUYwm8LUckgBDJQK6+u5G6B3dZ9qOyiwx5n4b+9xBMi+Ec9bpL/ZgUBGSAqtJQEq
	CcV45FOIiXOKBetHA7EA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21uhcdvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:52:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DKqS8g023470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:52:29 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 13:52:27 -0700
Message-ID: <254194f7-2a17-4a3b-a0f0-85cf0a5a2338@quicinc.com>
Date: Mon, 13 May 2024 13:52:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-8-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508002055.17705-8-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WJpQTQW2T4r2XC-B-J4VQtlB5GkVp0Pi
X-Proofpoint-GUID: WJpQTQW2T4r2XC-B-J4VQtlB5GkVp0Pi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=829 impostorscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_135230_718582_1AAFCB1A 
X-CRM114-Status: UNSURE (   6.79  )
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

On 5/7/2024 5:20 PM, Pradeep Kumar Chitrapu wrote:
> Add support to set fixed HE rate/GI/LTF values using nl80211.
> Reuse parts of the existing code path already used for HT/VHT
> to implement the new helpers symmetrically, similar to how
> HT/VHT is handled.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


