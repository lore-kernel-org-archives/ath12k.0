Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C075C369D0
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaqP8SFKdRxw9wI8vP2V3w7liQVVhNjnjDMQWJx/Nmk=; b=VlFDGhalF31djFVTpo8iQNJQ/J
	sY70wMo0pTJXcN6NpDwSoMBiFqaDrHY9SkhdZNPtc7qTlUIoyAfZ/wsxlXvVLIfOWeXWSZ9rk2QKy
	vz7jOK88AX+yiZVOCHUfC5s/m3DyD23Ztl0ZzgJP/xI2MilCWi1kIzzpCehGVZgJrlqFrcZpNnh4Q
	AJwkvCnZmjha6IHawrLFCm5KTcnsUTesESw3DvARP6rBbM9Frkeonme5AW86JSw9wvpXIzaAPbhE8
	nClLkm5VnC0bUprsq74sqhB4Byn1RxOcyGs7TZ2AsnbUOdwlcO0vhWJb2I+frCcnRIHice38O0m7s
	NSOaDTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAw-0000000EVRF-3YG4;
	Thu, 17 Apr 2025 22:57:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAr-0000000EVNM-3ImT
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HMnrN5019847
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaqP8SFKdRxw9wI8vP2V3w7liQVVhNjnjDMQWJx/Nmk=; b=Fld7lMpwPppeRY64
	undIF+KYspbLS/XcZyDwM0iECfyXR7+qyIR/b5DbK0PtYseocH3ayYGj/kilpssc
	wzEFJ3TvnkdwsRrOpjqtuN7XH1bk46NgFHj7h8u6k14Tbay8KY5bFUw+vMkBHw2N
	9ZMo0EMbzEuFpWAmPqxqtDm+G0fb6tAZ9dIQjT1VoIAaZ4ZcQ/j7Vbyg9qcXJFN8
	EhTPXNXxXRsWMdDW9JRhPyD7M+Hg3mVKUSfxr2jyRT1EGLU2/gDjw+dqlz6LYJHG
	B8ZbiCtO4q4guOcy1/a88eSIrj8YSJ2rXHYxDBRnZ1yxog4iKgRlYMevgCMxxvFt
	iPYCVw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wred9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736c7df9b6cso1521960b3a.3
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930655; x=1745535455;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaqP8SFKdRxw9wI8vP2V3w7liQVVhNjnjDMQWJx/Nmk=;
        b=sjMJFT+KluCEb4rtCG2Ur49+BQlXgU5ETzuwG3l5dK8Y5bJg5UItj4nPUSCucNgp9W
         ptMy8rIc+6AQT1cPyOpvSz5hEPIr8X3tMpaSLzZVhl71rcjjEVNmyRKaAI/EJYKoO1JJ
         3oTVNlZUssvVqvFs4HXNoTHRl0mJdNEYwhpbC2faVHC91UfHkCtEQyYxY2LadXRfRJzl
         CqFQAPdOsjqMQI+crFItD3faVa44JrgOY8eUPgHic3i3QYrjRYywoFWYRuOCSJpRgF3e
         IocRyBbqiVSLfs95gmLxcT+q1bCflX0n2kJPsM3iwN6SSwuBrX+PZ/ZwpYYJP3PrI3Ef
         O50Q==
X-Gm-Message-State: AOJu0YyZme9PnzM9croWs7xP3qK/Ii8chL14nz7i1GzYwKftn1z5rA6n
	aqWf2EqdIWCh0Adx+LIzoo7VqF+DQm5Mmuqm2x0qnjhXKP2GqaiowgNSXWAAmjIO6swhSf7N9Oq
	o9clqK655cFnRv2qoUfPsxZWpqmuWrU0YvdmGyv17xgl6vTYzHXQE7WJTgsFPpimTaF0L
X-Gm-Gg: ASbGnctuN5fSl0bjUtU85ZcMQsW2ZLn3DyeGBaJ3rGaXhhzCTIVaAobTxirJR1gZ9zx
	ErpXSq5plSxIdYUIS4EKGv7EeZiEGB/ADLZAt23ks1grUZK/xgxvSG7zsfdl+NGQmw08gKJS8kw
	elfj3IVCbf8f9DJ5fJIbKCY+RX4yy+xbwoKbW7mKW6GWPYImXAMVX6aoVSele1//72o8ipy8EuN
	OZocTk6LQr3A3Sxg3rnR6IPuIA0uasxCotcheAqQYCHzW29nHR2N6dTTjIDXthX2l3nIHWvRan+
	vynWxBbuKwd3sYdC6sCIyXECSlXX+XmZaTsjzrRLyQ/CQ00g
X-Received: by 2002:a05:6a00:10d2:b0:736:4cde:5c0e with SMTP id d2e1a72fcca58-73dc14abb4bmr616824b3a.10.1744930654562;
        Thu, 17 Apr 2025 15:57:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIsWiZtYwx5CeHZ9+d6X0zLI+TIHALQGncO5RbwLXgN7l1+Za5zl6Px5QoL7ZVPT5gFzMUuA==
X-Received: by 2002:a05:6a00:10d2:b0:736:4cde:5c0e with SMTP id d2e1a72fcca58-73dc14abb4bmr616804b3a.10.1744930654087;
        Thu, 17 Apr 2025 15:57:34 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:33 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Rajat Soni <quic_rajson@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250408042128.720263-1-quic_rajson@quicinc.com>
References: <20250408042128.720263-1-quic_rajson@quicinc.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Properly update frequency
 range
Message-Id: <174493065331.1347382.2819170048553600986.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68018760 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=hJ9QsYJt4PUDyDSkwUAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: du374-t8Z9nK-T5c6fN83IQyWLsw8XTE
X-Proofpoint-GUID: du374-t8Z9nK-T5c6fN83IQyWLsw8XTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=886 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155737_949797_0A069E0A 
X-CRM114-Status: UNSURE (   7.88  )
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


On Tue, 08 Apr 2025 09:51:25 +0530, Rajat Soni wrote:
> This patch series ensures that frequency range is correctly updated
> compliance with regulatory rules.
> 
> Aditya Kumar Singh (2):
>   wifi: ath12k: Fix frequency range in driver
>   wifi: ath12k: Update frequency range if reg rules changes
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Add helper function ath12k_mac_update_freq_range()
      commit: b7544de8a2984e61b95c58c1c6c1e8ce659b1021
[2/3] wifi: ath12k: Fix frequency range in driver
      commit: 657b0c72c4ad688d424560af98e3258b3f875a4d
[3/3] wifi: ath12k: Update frequency range if reg rules changes
      commit: 13324cecbb2c390a11f1fbfe87f3a5e62d6e4591

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


