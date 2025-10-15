Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AFACCD193
	for <ath12k@archiver.kernel.org>; Wed, 15 Oct 2025 23:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3x0IYHbY4tjRVt2udhF3EIVJWGOX/Sl28P39SVnXZ4w=; b=glRU0UcQwgUR5OREnsIyhZnE7d
	AT1Wfra0pNGSTqeFjUn3lp7Wz8MXAIrr4XXkWhv7QVFdeM1rWXioaiDwZCBxW+sfW0fGRP3sgZRcn
	bPd/Lk9ELpC2Tze6WBJaeMr+GGq6srMQ/9tR29pqtpO97xzqIXrMnK6n2naZnFpi9J9zgutoL6bXy
	gwlEXovJvaJtSK5/zE1Q4p0ekq0jL905aY3poKyvBSv8iPpguiMyIOS9J+exPsBDSP6PU7GMNKmFZ
	m7DHLpXPCtsyTP46AerEa2gtaxeWejm6qJsU/Z/0Ssm2UGtCYfPQFwQCrMIjJJA3eubRrcAfe8E5y
	Tk0vtr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6e-000000035hG-1Csa;
	Wed, 15 Oct 2025 23:40:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6b-000000035fl-3qSg
	for ath12k@lists.infradead.org;
	Wed, 15 Oct 2025 23:40:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FIQV2O016060
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3x0IYHbY4tjRVt2udhF3EIVJWGOX/Sl28P39SVnXZ4w=; b=igZQw52Q6CcA/xnU
	oaZbb8ct1lh+XSfgQDiC0bG2RNrlKV+gSDAtRyBF7bHBSliDsvaHamTzqtPVCSSf
	OZ5KEG7jlsLY8nUL3lJ+DTU4cWtyLsLDxhCf5+zZKZKILTA3yXnRdClcfxuaBkRX
	bHDb3PDfTDx/xjIQnEUBp4vIbUxYs53rrINBDhEONsqn5EwthUTci6lMgjHz1RA/
	4irwqgvQrZ3dW7wnaGRrV1qQhJRYUssyFd65tOLne1AfXrr2VANdS7F0upR5CCE8
	C9WCH97+H/Skcu3YfCSXiqufGR3LePWG8q27a0dwtujgVfLh09nW4fOWP1dBWcZa
	HIPSRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5pd20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269939bfccbso2255755ad.1
        for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 16:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571627; x=1761176427;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3x0IYHbY4tjRVt2udhF3EIVJWGOX/Sl28P39SVnXZ4w=;
        b=NQEuxIEr3EwC0ose8hVRiNTAlPYv414SGO9FEi2R87NDc+gKTSYhQqDxGwqcYC1yzy
         X7N+z/Rjl+vIz+gMNNUfWy4plyfJmvZIrEr5WkxYPBEdbMOMTWrzRFY1BoAslFfY26Iw
         0NyE08bCH1rDxfcpdLJE2XnlqC1mN71JaQQHs0X5b/gySuDkoJ4Nxk5nej8TeiboFzAz
         B/5iDjMX5M5Nr+SawnblyfhMNdiKQIs9q6STQ3ZkeeVupqn3ePXeYC2+FGZcVLRUMeNB
         XEWcuhy3GOrsII0qmK/nFaqMPRA8tcu6wR1a+9BE/uGaypW1Nh5PUVaiEJCoijkkl4cM
         GMWw==
X-Forwarded-Encrypted: i=1; AJvYcCVvPhcY7+wqLD6Tj5CZpYEdQXnOo+z96sb5ZyTHwh0ADE4T7U76O4wV7oI0HuWhkiv+iXJlZbQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrVJF/5sZIkUFx560ZcSEvPxmrl9gxFfvmCUikk3UtPxikUUY7
	v4B3f7THQvfxQZZSBDocz8htfXymSzf4aPsXfZc83g3x6M0BTfh5GVDb41yhQ1Mw0Qmavq+0SUz
	yo2hpQnK4sDRJPb0Q9fSr8AIhdnAN3sdSrIbxVCqBkEviR9XG8tPiiDPOMfQy1l01EOX5UAb0
X-Gm-Gg: ASbGncuTDIcG4n39ZBL6GOYouvPVJ3udm1xVzMlQsK38hZNo7WeDXUbKKeKInr/IFiA
	QfEs23XoGvpGdVrwrvblPtTQmI34gKMNFoYQ/h3Hi6nt9Z9yTQ/3xLjyT4luuYOTVResm90HGHC
	0Q+eu8+H3QbB90nC4L07laLF0b+crum15KBH01Ts+7e6zcdhwaaqX9fOHQ7KHFXX1dlnaoZsa4H
	R7vTagF9S3cCyCjPpDVpAMs7TkhjqL1KjhBvgAnZ8pd83E+j+vuc9sS+pBOEBPPmjsd6D4Htblk
	qiPnbD44DyuIqAe12ve8UR3PJg0mm90gXsU/fgXM/l4UllFeHgop8i4BlLbsqy4Yfn6maBmA6SE
	npJ9Lxhtq98sh4SdlelCvyb1hW1FpZE3TxHs=
X-Received: by 2002:a17:902:ce0d:b0:26b:da03:60db with SMTP id d9443c01a7336-29027373dabmr426101995ad.13.1760571627514;
        Wed, 15 Oct 2025 16:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH636KnbNowyw/e0DhBDEBumYhJ9OCqLiKg+5Bgl4ES8cb0ngFTq5Arz3CAFiEs69m79TPjWg==
X-Received: by 2002:a17:902:ce0d:b0:26b:da03:60db with SMTP id d9443c01a7336-29027373dabmr426101755ad.13.1760571627089;
        Wed, 15 Oct 2025 16:40:27 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm8055635ad.70.2025.10.15.16.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:40:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251010-ath12k-nuke-wmi_bcn_send_from_host_cmd-v1-1-6f1172b77848@oss.qualcomm.com>
References: <20251010-ath12k-nuke-wmi_bcn_send_from_host_cmd-v1-1-6f1172b77848@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove struct
 wmi_bcn_send_from_host_cmd
Message-Id: <176057162643.260563.1781488828218446991.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:40:26 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: alYu6JzUZRXF-Yhnmxbl1UlBy2-KZExP
X-Proofpoint-ORIG-GUID: alYu6JzUZRXF-Yhnmxbl1UlBy2-KZExP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX1ufYn4lAahFh
 vC3XMDSD+bq7D+KJHIWBsRxar/PkiRuQURckA3Ag0zSCW42hYB5zVfdxlUDlsFNp8lAWmWaM0mC
 fIbaXe8I9+8SK51Vje8z0FtALM7AkcLv46KGgk9wOChay4wa0k0Drd/qnHFimwEhSLnLvG3oYjF
 RNtxent1FUI38W94H6PZPyh0SqrMIWU4Pe4XcNxxYmiYfQ1cN7raX4FcRzfENjcneSaReALoxDh
 1kf+Gdf5hGJ6oE9wPLLgpZopUbrYVYPVKd62td7PhnYCWyYumjkleuCjVZoK56xlPavYT10R65z
 JtqHiWjg6PpdM0ZJ3cfK6jM+HuLbH0R3U6GHxOzW5TIZgjhcFAlEE8dZLmCBH2SpXzLyS5+B7HV
 tDRA9UlrG1lagEznL2UeQVhHBsU1sw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f030ed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-EFR5erphFcivXFsqSgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164030_101353_8D66630A 
X-CRM114-Status: UNSURE (   8.31  )
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


On Fri, 10 Oct 2025 09:47:58 -0700, Jeff Johnson wrote:
> struct wmi_bcn_send_from_host_cmd is unused, so remove it.
> 
> Compile tested only.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Remove struct wmi_bcn_send_from_host_cmd
      commit: d34a368be24d029544cc97feb87729a9f7984a78

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


