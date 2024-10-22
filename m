Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59DED2C56C
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFkqlKGvaFMJEMuyKE4i4ASVIdxSo9TRXOQEu6TIIE4=; b=r8JVWnkldeOFOvN37A9OJ/wjSp
	jDd+nZ8TLx7ND25tcfTcc0EHDU2vSAxJLJY0em7GZUOwvANqveFPObAkrMQhvR7UpuyZxyiZgww9p
	c4Opd+YREBHfjHJeNm8xeLQDaj1x87QPiW/2fjhkszAbzewMyVx++xb0P6SroCAqa/y5eAwwNXgfL
	ty6GE2J0p+O3QhT38L+cW1Knfiu2ErtP4+zVyZm9vXLRLrvD2JVHicUjoV5Z7hV9HpTQHxkOOXMhW
	6LaVhuNRNywwic8npTMUuvOAlp0dkkodY4HWni0gJnqaBs0nvd9Yf/4sV2dzoT48LKABXqCkEQ/9b
	5OtFl4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3GTz-0000000BCit-1ZG3
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 15:07:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3GOY-0000000BBmE-1PQ7
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 15:02:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M8cl5E001061;
	Tue, 22 Oct 2024 15:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kFkqlKGvaFMJEMuyKE4i4ASVIdxSo9TRXOQEu6TIIE4=; b=odwI68V+bzgfDIuD
	mGRvO4C7s6XpRsS9AKsIlgZKGJOdU1biamfEBcGDBPmWVaOpvjYCsoyKNBbrmq4X
	kWZ3MuUwmBWzffEIw2/4T5T7m1JvJTuJalcPy6lXvrd3XDJe7j8Dk/pVPIPZxz+7
	/7YbrWiH4v4ufm83s4KQiSSmIvm59hFhsRl1XdsNFILVXMV7FOjs/iNzo/dEQCdZ
	vkfn2SII+JHAxKsLoCIP+5TeZFvJeaVzpFY+kihtRYQOKYHqre+H2kG5w/J3qADp
	HJoO1609lWJst87uiQq4MAXQJKXJZ8K7zjqFRGeh5joJpIZZlOnEnizEcMWleNDv
	bzdWlw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj14nsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 15:01:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MF1t7Q011896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 15:01:55 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 08:01:55 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>, Lingbo Kong <quic_lingbok@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241008093039.11076-1-quic_lingbok@quicinc.com>
References: <20241008093039.11076-1-quic_lingbok@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: remove msdu_end structure for WCN7850
Message-ID: <172960931521.3037585.1883780470150742650.b4-ty@quicinc.com>
Date: Tue, 22 Oct 2024 08:01:55 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R0KYBL0-W0ZVRg6hvwBuSyWakLKME_3s
X-Proofpoint-ORIG-GUID: R0KYBL0-W0ZVRg6hvwBuSyWakLKME_3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=391 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_080202_521389_9A772444 
X-CRM114-Status: GOOD (  11.48  )
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


On Tue, 08 Oct 2024 17:30:39 +0800, Lingbo Kong wrote:
> Currently, when ath12k retrieves values from the structure
> rx_msdu_end_wcn7850, the information obtained is incorrect. This is because
> the definition of the rx_msdu_end_wcn7850 structure in ath12k is incorrect.
> In fact, the rx_msdu_end structure used by WCN7850 is the same as the
> rx_msdu_end structure of QCN9274.
> 
> Commit ed823fd113b7 ("wifi: ath12k: add msdu_end structure for WCN7850")
> introduced this structure. The original issue trying to be fixed with that
> commit is that the TID information retrieved from the rx_msdu_end structure
> was incorrect, and it was thought that the structure wasn't correct, so a
> supposedly correct structure was introduced. However it was subsequently
> discovered that the TID information is only guaranteed to be valid in the
> rx_msdu_start structure, so that commit added the logic to retrieve the TID
> from the rx_msdu_start, but unfortunately kept the rx_msdu_end_wcn7850
> structure.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove msdu_end structure for WCN7850
      commit: fd01ace1140476e97f1801a26e8e96a5626e3385

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


