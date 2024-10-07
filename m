Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDC1CED243
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xutLVwGX4uBH+NJkJwsYkG/0UC7q5qR2voCeLmDy980=; b=j6wN2qjntU0TBycXE6M1BMrMh+
	FCCO/naJCyCMSdq/bRsJZbNRelfIaR+E0M18VphLjchkt3yXiq/jzOwisNzaOIRgDfrSGWno/yPvq
	QR2hy4w4WzkKHupSywjFS5Q8JCAKVXU4+NgXp/2cGXsqW046EZN13ErARzMoR2sU8G8Yo+EKyrmbQ
	0Bovnz/O2wpLJE6QPC0pgnQpbAKuxt8za4ueftbu9qb950vxw+RutfCh4R5iZ4EizcE7lH3FNiIGX
	L1qnounAS0zpLuc0oknjKAb2M0vDuVEMLW08lXinzS03MsvZOz8oggFKoWILL9fYLJdZNEk95VlR6
	Czps0SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxvVf-00000003rI6-3XYb
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 21:43:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxvVb-00000003rGZ-3EeB
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 21:43:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497LS4oU006029;
	Mon, 7 Oct 2024 21:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xutLVwGX4uBH+NJkJwsYkG/0UC7q5qR2voCeLmDy980=; b=WHfV/Vqrmk/rFsUZ
	LN39wzmoXJIxLMJBXWOBo8zZLbDdyoepoEsImxlI+rJMeJdMrA6prUtQ7o3YSCYf
	phPiGkoorZVR1g0zS+EHevCjhAVZR0mifnOOLl0dNq46Sw389x5iNoNVQMH5DSAO
	v9jeu6l/odUl7VmzkGEdLWhkIO0SI8zSF60JNwQ4DqPfX24HQdh8Eu5LFJEo+vge
	4VfE+3Y8nwcuzo4sHqK6VPMjKrnpZH8jekF6ZKn/xhE4HgouPQGNQySjAko9opb3
	hz0DIs+Ay/NL3rFtq2pyWr+bFkyr+rYgfQaMd2JLNpSZBkxIT9FPLI1dHTMGedlU
	vK7zdg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy79t75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 21:43:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497LhCPZ011547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 21:43:12 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 14:43:12 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241001092652.3134334-1-quic_ramess@quicinc.com>
References: <20241001092652.3134334-1-quic_ramess@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix use-after-free in
 ath12k_dp_cc_cleanup()
Message-ID: <172833739247.2581613.18305318336936114869.b4-ty@quicinc.com>
Date: Mon, 7 Oct 2024 14:43:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8nAsk93DWGXmjyRQ1GuomMAWHXcQbujk
X-Proofpoint-GUID: 8nAsk93DWGXmjyRQ1GuomMAWHXcQbujk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=544 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_144315_965892_56D17CDE 
X-CRM114-Status: UNSURE (   8.95  )
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


On Tue, 01 Oct 2024 14:56:52 +0530, Rameshkumar Sundaram wrote:
> During ath12k module removal, in ath12k_core_deinit(),
> ath12k_mac_destroy() un-registers ah->hw from mac80211 and frees
> the ah->hw as well as all the ar's in it. After this
> ath12k_core_soc_destroy()-> ath12k_dp_free()-> ath12k_dp_cc_cleanup()
> tries to access one of the freed ar's from pending skb.
> 
> This is because during mac destroy, driver failed to flush few
> data packets, which were accessed later in ath12k_dp_cc_cleanup()
> and freed, but using ar from the packet led to this use-after-free.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix use-after-free in ath12k_dp_cc_cleanup()
      commit: bdb281103373fd80eb5c91cede1e115ba270b4e9

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


