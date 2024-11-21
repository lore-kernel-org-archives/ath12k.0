Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC058D78785
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQ+WFixI+DUJbZX7N0hWTEABNSlsWjF5Or89OIfzfsU=; b=i+U47vP7vuqFNkbvalbnIoUY6A
	JHG3LIn8BNSNUwMZZ/VgBICJa1nkOpi/xwhc0JMFyWACW2O2FsauNoPVutKNqOvBTQL0mA7GH/F2+
	S0qdmph3oNFxcBTjntUVdMnjHyClC3OnWUBLHUiIC0R7VB/8otpqPB415hnLPgyn4bu6gOVeynbtR
	lDbudcMXkVX2+EUrsoPTK+xi8MXkTspaD/HFg/Xf0XopQ/ba7xP4PAgR+IXa1DbRQsj4pC04OURoH
	torbzGfu0f0eAWTSaDrDgQ7HfmfdrP1DvZjvQwhkdrWAppdffVaoagNbZm7k9mzKNB6dj5m03NQmQ
	VEnUTBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nR-00000000QZt-2Ffk
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 16:12:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nO-00000000QY3-1RVv
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 16:12:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL8jMkU003948;
	Thu, 21 Nov 2024 16:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQ+WFixI+DUJbZX7N0hWTEABNSlsWjF5Or89OIfzfsU=; b=FjPKzF39msGc3hep
	Q+vLErAUPIQWZHVo+QwWbBZ6iwWriDujC11Po3QqqVqZhmbvJzYtf6MySm/wP5VC
	9tx2+lFqvrRgEoAF5Q+j7QUdWoPxYWpf6sQkNgFR4XX6aFclrhVIQsdgSDvBk6ba
	Hkx/JYAbps1aZz3Z1IZ2iPJCo45Ld7BXVBlH5LtgyZ2+yu+1JWXPqkqYMBZDYP3z
	Il7FMjwKUGatOQff0T+cyd10HcUapZ8z+VppBo23sEdROQPPb66J/qp5Vxz06paq
	2RXLbOsABH0oN9mxQr9VJRzJ5+BxEG2MCxZk+r8z34iXI40ZdssFMyyMApe219eP
	E7a1sw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3ckx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALGCeZq023479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:40 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 08:12:39 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241118035722.1755373-1-quic_rdevanat@quicinc.com>
References: <20241118035722.1755373-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Fix inappropriate use of
 print_array_to_buf_index()
Message-ID: <173220555971.3016923.14190692040130925339.b4-ty@quicinc.com>
Date: Thu, 21 Nov 2024 08:12:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p86jXSQHZNWzZ-YfzFUFsLme-_lZ2shF
X-Proofpoint-ORIG-GUID: p86jXSQHZNWzZ-YfzFUFsLme-_lZ2shF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=569
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_081242_389675_29E3A123 
X-CRM114-Status: UNSURE (   8.61  )
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


On Mon, 18 Nov 2024 09:27:22 +0530, Roopni Devanathan wrote:
> Currently in ath12k_htt_print_tx_pdev_mumimo_grp_stats_tlv() the
> htt_stats_buf->ul_mumimo_grp_best_usrs array is printed using
> print_array_to_buf_index() with a stats_index of 1. This is meant
> to convey the semantic that first entry in ul_mumimo_grp_best_usrs
> is associated with user 1. However, unlike some of the other "usr"
> arrays which have that semantic, ul_mumimo_grp_best_usrs does not
> have that semantic. Instead the first entry corresponds to user 0.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix inappropriate use of print_array_to_buf_index()
      commit: 47c7ebfba30f242a24a89317c74eada47adfaa95

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


