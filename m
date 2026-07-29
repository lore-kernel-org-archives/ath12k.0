Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F80C53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHn3z83Z1e00LEDWQ5Z3WIqS6nbwKVZUmDm9mg4b/Ns=; b=HfXthyEa4zI8SZousjzOXHOqHv
	5Bap99OEFtPIjk74j07tGBp1kQfj5z7NemBJSo9M7jmfb/SYxflOxT7g1/ZZjyOoLA10aIP+/pxlZ
	pse064P5JNU6iuHpCWRJaDsIPRyArMzwdakVM/mr9CHwsgoBkEyJrH4f8Y1P6lx1gjLEOZ5kuUvZy
	HQEkx+4K6FIcAgIz6wdv78Ant0qQeXuJhK0GR2E4qVvCVmfTe0tpd4nCeojOOeV7ATmyKUMuCffB5
	JS3gBKaF/YG/vexFkc2hOO3K10CNnI+B/m/wG992OZPh7sxQkG8XWlpw5ORzKCmr/zbz05di1+6PQ
	Rd3eDMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6UX-00000008Rgq-2tGB;
	Wed, 29 Jul 2026 15:46:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6UV-00000008RfR-0XlP
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:46:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2GJe1698913
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHn3z83Z1e00LEDWQ5Z3WIqS6nbwKVZUmDm9mg4b/Ns=; b=h9+SSUmvbHGF5rLa
	GuYjgcXFTLqARvq6F3ZUCK7U/VGvYI3bJwKvXVvaISoRBsxbhZSEaQZwBqPM5Txs
	+y3GEjKPUZ+1bqKYv/Iyyf/fSJ4Afs2myTpCGNfa0/NzZUQMO7YuEZOLPpRdwf2w
	mUAdUk6EnVfD/Jl0v7I/ingVcA20O5QdTUATKKRdOVQaaF+fyxoV+GLXCQ0kBgnw
	eEQH2Qsg9xOVHwA8TpPF18KH/XpXjIwkgJEyEBVgnOvQRVQTZK4fdwAprOVZD7SJ
	GZfGmnjhlXrk1bBqmj/ZCNlcsx/PZ/ipKFtV6QSwEg8sTJUshTDXtvtAG/8oJ0+H
	iwGNjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj17qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so26186815ad.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340002; x=1785944802; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHn3z83Z1e00LEDWQ5Z3WIqS6nbwKVZUmDm9mg4b/Ns=;
        b=eRidX12WMYPBsXO9dj6H65mgz5UfbDrybETC/Z4JH2xsQbd23fvHEHcprpkxs79vS1
         J9dCyBqTmqCBipx8rTj8y04A2cYcH7WST1tbNnV+0VlI/xJODP62cyg0Po10B5KwQoWK
         xFFoClUzNCFlGId6Aa8yzxdq54L5NnYZFOHjU/vDl92QwYQMwkO9OAA/bSTTdGQrJ3k2
         GDoAMSMfQg8B20ebbV+hXvzxVE3xANocg7qlSe7hFa12yePj5GyrXOr0vgA8pDrTnzpF
         mmh3l2fwoMyfRN0lnLI/II4TFgYt1ERWm/Ej7Bmirh/xuXPElWMstePZmB5O9C4HnoNh
         5oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340002; x=1785944802;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHn3z83Z1e00LEDWQ5Z3WIqS6nbwKVZUmDm9mg4b/Ns=;
        b=nPBFEq03jtonXIoPsoC62DVLlI0MjWX3K6G7wBaf9osstNB4hk8ngo0oxcq1dapr8s
         Tr+vXxahtTv30qZvj/pX7PtAZAekyLTVAO0EgBhHtgXlO/VeRRzesvzxDayS+ATk0MGc
         NJJxwYtJAjOoS4+JWZ+4DzHQMqPoaU/hVmAOL1lOrcUmEyQDmpYLJPxm/cUb3o37jTmV
         FyWc26w0yLmNaJKL81i/KuFFzAshmsvl/WM7DDMauChj8IBAeXDGP6SaQWnrhLItypEC
         rBoO8hqpC0O5BFv28dbJM75a8Qkn31Ws1cPwYv0+ZWtes+4aNdk68msVWh7zj+z31Gu1
         kpJw==
X-Forwarded-Encrypted: i=1; AHgh+Rpvt+GyUCUZGczr89Ix9MGO4rc47FP671kyYARm8yrDWzIDd2xZ2F/Q3A/ZvHLsC/gFG4t6Sbw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyznGTdVgp8eyll5FpbHyY1w7LzTWKLQ7Ban+tdbDGI17eOHra7
	IyEgUsyzFsulDcIGoZsRP6Y1jS8bALZxC8xB7R2Luecrr2Aok4WsBiyNP/VzkY3kmXgAoKPu+vx
	n5tgBeVD6fAUcDYtAccJSdcLl0xBGYRTYk/RFs3C11IYYwP99gBh83hB0sVbvWBq+
X-Gm-Gg: AR+sD12vVnyfGyC4QyV8ju9XBWntsdfXzbpasG5lDP8Cb3283u0O8FMKVSJU7+XB4bE
	/ojbi/3S8/0fFZJDhmQwKo1/hBQPweRA2GieYQmNxsOvyTtbN6SjPPJbSCFBfK/2j+1l7KBhCCK
	BJZGvcqMZyHWaqiQtDzSr/R0CmBew8CS0vycokQVw1VzGcQngM074v4GthNu5buUr5LcjgAyjI6
	shT+lwLGDeON/L2S4R9qUvjuZZQHVFYf7O+9y8I3F4ngWQ891rxzwJI4NkcUhMVdLVyk6Hp4xnO
	EZNbe//QDRIDS21cAX5LpLPzx9dTXZ67RfIBXP3PFPmnIQzHu+Qc9GVA74YGzdqFqAU+tzyJJLz
	AlePwl+s6OG/IWEOVdHZufoVmZBtn6n7eSLSJ+v0mJuAyY/g4OAnIWVk=
X-Received: by 2002:a17:902:ce89:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2d015b14a19mr81944655ad.3.1785340002116;
        Wed, 29 Jul 2026 08:46:42 -0700 (PDT)
X-Received: by 2002:a17:902:ce89:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2d015b14a19mr81944205ad.3.1785340001609;
        Wed, 29 Jul 2026 08:46:41 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a76a5bsm13577185ad.35.2026.07.29.08.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:46:40 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
References: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath: Fix buffer overreads in CSA
 switch count event processing
Message-Id: <178534000034.2826154.16110623603163023219.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:46:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a6a2062 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2ZIKi5-oWpO6KCP1_QMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: baIFOxeBzBcD6rJGKhKBg48RSYKoMXB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX2Ylm9szjXWoo
 zGYbdIUMGnJtH22iXU7M7BBaCyDhvYoXXAerHMO61a6LJuijNDS4lxGyo9prL6ihsOvMbK8pA0C
 7yGNQiz5zI1DPWiNfnqNPIyKBWrY9SBQ9bSRvy4X10PCwZ263Gr7Br2MF7QeSX4AcPsVkv8OJMX
 u8s6AYym4bhKxzLQhOSyPQgCUx1jISFIGbzK4HRkjgAe8JIfChuFGZ6ydQkdfYDYt5j/1hRHXvU
 u6dW7RCKnUFqWeeM/STxQ+/Voy8XS1e32Ad8wmUqKE0p/WAHehy2bETLx/iAjDcCQhbHGUFniHk
 tNmo8BMWtcDkr/yURtHhcqXqvsjGUw3kiZmwJXrhHHr/eNzQ9xkvEGxQfhtDXpYPIm+IudimLeu
 k7NrNP1c6j4cj4ySfQ90QG/36SxPJp0f3+H0vgHxXHvPoM/sI3G07ViFU5GGeJ78zrtHbcOCxjZ
 OHZHcu5DFrBhzg7l2rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfXzoljsjT1Ysri
 QnV/+3FMHcXL6/rbe69Zond3ZCiNKTNHPUaPTkVxqpOZY+E8um0Kek2DXDqkXvT6FbOLBaLphS2
 TWuESvTGk/OovXAdiJFFo+jhVqMlTRQ=
X-Proofpoint-GUID: baIFOxeBzBcD6rJGKhKBg48RSYKoMXB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084643_178096_89F9CCCB 
X-CRM114-Status: UNSURE (   7.36  )
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


On Fri, 24 Jul 2026 08:56:12 -0700, Jeff Johnson wrote:
> Both ath11k and ath12k fail to properly sanitize the CSA switch count
> event.
> 

Applied, thanks!

[1/2] wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
      commit: 878654eb78c6aa0ff585baf1376567c775ca28ec
[2/2] wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
      commit: 208d7fdb85976a737a715b81d54efaff6703880c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


