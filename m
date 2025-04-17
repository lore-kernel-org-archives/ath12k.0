Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD211C369C9
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrZ/A8qE3TmNhXxPvxfyh1Id2vxVljbuWbBwYswI28s=; b=zybw+5d3oNARAdcqMRwDzszLQF
	/FxNQWya8CsPsZDuMhJgX9YvZLlbeo3dvRid8RkBbT9zNoYnSuU8ilUENloVpgVm4CmU7z0hTuirr
	rPnaf3J6vGSNqLB8UjiHm4axbsjdAj29iMQGoqPLpe7FC9hA7v1plrftkaK/3w8M9PkqCcUv6NnBV
	byqL5JbgRJEJHzTKmn00HRnfIvR2RSaIg79YL/C7tPiWjksLrkDZ0842RHMv0s1p8iylyDAHgf2X6
	lm+yyvpgQWGxt4S0regUAz0KOSwidUw2RCDt4e7WAHCVjTJo3ns4USQ4iN5iW9SYcmrIyA8/9UbO1
	vIPCBJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YB0-0000000EVW0-2efO;
	Thu, 17 Apr 2025 22:57:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAw-0000000EVQB-1Ux3
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClSoo032057
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UrZ/A8qE3TmNhXxPvxfyh1Id2vxVljbuWbBwYswI28s=; b=SIkC8FB3sf98GXsq
	39pQcmMiJfA16SD8n3DhlVO30KkC7pKcxXrYiQ2a3qni6DUKI1ddx6M67Vo+Vp6f
	+Ezur9b/gkjizAJkEsagKZc/pn8T+fdi3+oTrt+Fts6i9GwubIKYju/nMqABhOYV
	650EH4fiLQ/fgduj+KnsJkt4CuHyXioBLPK9g0EvzZWafbPQsPUns8yjcsG/UYkH
	Dq2W9AjfKDUjR+VGZAiI2sx1L42qf+TzFwm5ofujIoYC8sXPfAz1H1tvwJAdUNff
	NUQPDgPoqlP7i1Z6M46ZjnioOr9vzjLcjezkACVBDrG+nID5J3EoZSVdQNHkWAyR
	hnN7Gw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wredc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso1482510b3a.1
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930660; x=1745535460;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrZ/A8qE3TmNhXxPvxfyh1Id2vxVljbuWbBwYswI28s=;
        b=ZxsK69addDfjgijOXNskxxg0giv5wQjkjHVjDpUeJ/dLaa0zVXHiJNw9ZUtrZlJrzM
         29rjowpc4WIdnMgQg5SYONvoBYdzQ5WVUaSbfaMINRPGitIF9ozYWN8myI4xBBcpBcMc
         co8Dz6Llqg90E8kHmxOuZslApwWiVMFMt51h5DVUQDj3nucRWCgIGLQrASYhVZEGSJzo
         PwNnNu+rw8di56Ap3Sv5KWcFtlGsmqMnblKNKrYRkUXfzLoFc+Q7GxFtybX/bq7ytAt2
         GJQRZPga1r8ZvMWUWx1tEP8PaeZZ6jOF9FW7SYrxVTVVTGeZ77hrLK4Odv/AI5yGr1ox
         IhIw==
X-Gm-Message-State: AOJu0Yz6/xft8Xtdsds8FAi7j1CG3Pf5ws4N3DSjTDnC2CHiBE8p05VY
	oN/YnYawhDGwEwNg+23Y0vPBESsOXnHHESjIfogtCArRF5U7/t3EFz1Pm3XjIV8inXUKPHx0Ffm
	46/9JKy0DRhKZqUKXKHUJis2uQuMso7Gk/KFtBbuSm4V+JVcs+D8tqQzfB/VP
X-Gm-Gg: ASbGnctr/Zk4k4OZd7qFOUJPWB2YxacJKUs0Woe1ys6/Q2z+DNStd3MhKMx42Xg5/ui
	mT0wd5D6ahePZK3kON014PzykHt7wYDK4fvfBeMDDceBY+bk+eoTeS79mcccCRpHOsRoV+SEu4p
	b5WIhd9HmPqT1ci+jagdA69GfIyxKQziDI+BNlviX5MhE6sSOlshxqfo94KxxOnbu1jOOjVkTC3
	jIMErczAXsp764pW+EXZOdqtNwIpwY+lnvF93xK+ZlZa2hiZCRXVfxComMJqHhF9n6RRrM9SNIu
	vyoRFtyZWoFd5hWMCduqhtofpw6CUgudvWNvqHyJO0Qp4Pxu
X-Received: by 2002:a05:6a00:e14:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73dc14a56dbmr637978b3a.10.1744930660050;
        Thu, 17 Apr 2025 15:57:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu+SuEbiUZR/tcgbY/kyQP+XQi6CyUvoWlkjtezDxDK+rygvzSl/3PJzW50WKH70r5Mk6l0g==
X-Received: by 2002:a05:6a00:e14:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73dc14a56dbmr637962b3a.10.1744930659658;
        Thu, 17 Apr 2025 15:57:39 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:39 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250415195812.2633923-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250415195812.2633923-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: set proper key flags and
 MIC space for CCMP256 and GCMP ciphers
Message-Id: <174493065907.1347382.7895541725664427227.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68018765 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0LDGy-T4u2czxLXLstwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 7MaN4AcCN_dw5iHN7iH_1UodUKsc1ZsM
X-Proofpoint-GUID: 7MaN4AcCN_dw5iHN7iH_1UodUKsc1ZsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155742_612969_3B682DB6 
X-CRM114-Status: UNSURE (   9.42  )
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


On Wed, 16 Apr 2025 01:28:10 +0530, Rameshkumar Sundaram wrote:
> Currently for CCMP256, GCMP128 and GCMP256 ciphers, Management key flags
> are not set properly and MIC space is not added based on the cipher used.
> 
> This results in unexpected drop of protected management frames in case
> either of above 3 ciphers is used.
> Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag for above
> ciphers and by reserving proper MIC length for those ciphers.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: fix wrong handling of CCMP256 and GCMP ciphers
      commit: f5d6b15d9503263d9425dcde9cc2fd401a32b0f2
[2/2] wifi: ath12k: avoid multiple skb_cb fetch in ath12k_mac_mgmt_tx_wmi()
      commit: 0ca04ad0cdfb7ac2ebd79dcffebe4806e8707a74

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


