Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DAAD1266A
	for <ath12k@archiver.kernel.org>; Tue,  2 Dec 2025 19:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=; b=D2SC2pwb5kg2cM+Yg8MuQFC5hI
	0Ztm+xUNOenz0gn3KucBxvnlQYEkH21uk3wUrHZygj2ey5gqaFNHWAF+B8Mo1BjuM9tN/uYeC0xTZ
	9VWCTL1voSrFmoqN66rSJvRoqc7pygWVxZr2DGV4qyTb01uBEsrrDBtDM8bETOWXFqQS/xcSN0jvk
	eGIdWVRxH6uIH+sMZrbcOkwZpZ54+SEIDfzA7+j5SAaJ6smR0RfNpHQw12q3lHNVkM/2pdbGdidMg
	HVYXkCBwv0Pl1H1gy9dSUOdE/12cD6TuZjKCWlDctzXWQ8gY8NpaJ+7UBGiHwweVERwahlmjBSoCf
	M1sKhRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWES-00000005lXZ-2A1h;
	Tue, 02 Dec 2025 19:40:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWEP-00000005lWW-0AzM
	for ath12k@lists.infradead.org;
	Tue, 02 Dec 2025 19:40:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2JMemj331193
	for <ath12k@lists.infradead.org>; Tue, 2 Dec 2025 19:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ymqUFuKgkW+1ZVITaHJuQJuC
	RC41Z8npiwRYSjupMVQ=; b=GAAOUGu1pnU7oMhHYLNJ8fln9vIgFPletMAjmeHX
	QbhEfK3hCHGC8rM8nd1noR6GdRmnjM+Lvg4Mbtw8UOHbCMid4PhWIKaiaAord7Xe
	Nx0e/3SGxVgyrld0Us8Fk6MHaoJJ+HRbosFLlbx9kiXPVwuAxiK2R3YKiNcoXcbg
	LhGShHpD7CKJEMu4ERU7Yw+lSo1DkdXtCyu7FKHm6zJv8DFo+L98V8Di8LWTmGEP
	6nCy5AL/ZlBCrpgqaM5tB4hg3Ub+2FY+bMFCVignQJ+lgEFda5zmOE3WSVvKgPDh
	GhWzeyWT/TcdIm71ABLZd7MbwyoxxFHcYwU2YrBUmF76Bg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at67c01e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Dec 2025 19:40:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so664921785a.1
        for <ath12k@lists.infradead.org>; Tue, 02 Dec 2025 11:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764704410; x=1765309210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=;
        b=ekZp69POjluadBd8fsgLdZK3oxaDQHVS/pKmWKWf42ihnMWbCy1PV10tgZFEzPWpFX
         s4HFLh9ceUCsdBy+RAngYA43q1HpaMnULOmGYiHcpd46/sUDf6cNld2BhXXOSn6/D8tk
         TeOKFVjt3Xdz2ZY+oxz3myMQ+SMpBNOxVxycNBSvjQSOO0VFilskunRIiKw1XdOkRhmV
         q/GNXrQkNkrWAy+1IjpFEWNKWvups0TBiiCSEVweSt5/O+gghKIlCKtKehJRagOsnuYX
         CxBGBEsft23OnB/fCLHXg8pLpAREmFlEKmAoLLO5jzOKdaxT4QFEn5jywLqUzWYYWOGv
         p/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704410; x=1765309210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=;
        b=ZuVYAuVoKNfIW1JuIuorH+CxmedDFk53+dpGghch2XfijsfkU8LiWbf9GA1+IDk27P
         JdLhZZE9eWIbvm6lLJAKbukGA/nSf3F7NyOyf9CLd/fPgikDX/Ehll/jDcdBRXYoJIVx
         1O06Piqedt0kyPggqdGZojyITmDv709x7Ns3ktpz0454O2a187P/7Sk1q4Ge7wJl83wv
         qXnKRQwTXxJCCa0rghFrQG0Q2wGsAnFRa94QHUVsElDix6IRbxOhKeHDK8N1zcMB9u3x
         qDo5ufTFyekhl3uNbCVsDP+Dra4YMP3oNhAqWD0sG5lx2NtWEJrHoOZbJvN6dmYOH18/
         B/FA==
X-Forwarded-Encrypted: i=1; AJvYcCUELEvCISnEGNsu8o/Tqes3Y/CtGv/iYugsU+D9lcT/mzi2Bp0+NIjO6MiQaruzCkH36Lg1Srg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3WfVo6nA3ooYQSZQJOOyX8DHFQwuIJ+129/aA5RmTi+GZj9s4
	m5pFK9sI2DrH7wfkZ24MdJAFmKuf3/l42Rf5Df2xXWMg6+2LKCX2RrP7GcKhIWKGUGjCosma/0s
	W8jKw25/dw6eR/YoS5KrzHbye+7pwv2RFnssOqwv9lx5Zj6ak+u4kgGGUi1mzFCjrLCs4iTUP
X-Gm-Gg: ASbGncv3afNnd1Y8eeVBtNQQAXFAwULHM6Ve2DYrq+T8xWcDI/AhRs8yR/BIOGRnT+n
	Vevi3Nhq8w0FtbojI7z16xuJa0YSm6TZceBXNvLjkKPr7HBVk5rOrROAlr4XSuvESpBwK5Gtbej
	VI4vqwC9CJSEGSdnXNT0ZeGmwhZdE0hvV0bPraPdPypVGzTGxxYSgcACotxeZ21E6MSX7JBhEhB
	0/20fdbxLYR9VJc6qjsOrIBIrRAYy3d/vZbyf1Q4ATuJnSXxtz4hCZf6hNpxJ8/1q4TUo771r08
	04vmfgs9UJrZ+AVXpcAiOH/E3suV+l7jHNxYU5s9kC/O8+hKAQulLN4aQ8Vj0MYXDLJ1mtuu+wQ
	ZAdfTg7vyPheRzI+oy9YbX2SEaaRp1gZxIcaWPR+AnWLxUG9z1Igq1sNtexNg7ZRDrSkodPrlpN
	HsyM6zSQz9ymPhWT7+o4tnaBU=
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr4219788085a.6.1764704410211;
        Tue, 02 Dec 2025 11:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeduTZfiwuLmEI3ux3Yzeal23XZK+cH0bfIgKG8RjjcKOtbLOA0MsLVdr+HitBOBcoOQR5QA==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr4219781785a.6.1764704409657;
        Tue, 02 Dec 2025 11:40:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7d0asm4967858e87.11.2025.12.02.11.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 11:40:08 -0800 (PST)
Date: Tue, 2 Dec 2025 21:40:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20251202
Message-ID: <xznwi36wauarz32zf6fzxug5fxpu2dd2de4mgnwoxbwkyanjfr@f4fwq6jtxuyr>
References: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qyKLTVgTJpTaU-Kg8PjZqKOdSZJyn802
X-Authority-Analysis: v=2.4 cv=W/c1lBWk c=1 sm=1 tr=0 ts=692f409b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=9XiVC44GTZ18DIIRa0kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qyKLTVgTJpTaU-Kg8PjZqKOdSZJyn802
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE1NCBTYWx0ZWRfX8QeaKAVlA6wD
 J2NQVYokVi/AtgDeg9VYU03iC0ASLb+VYWhfyXOvaq8pf4L7q7pWa+3NhAlJC5JrNY2asgpsSAn
 +6jEH33xP1RURk5PWQ3GA45Zd02dxsJLY//phPGjt17AElL68WPOV4E4O47LgCehwgH/+VdwbOr
 gXlg/r+DkPhrk8AKbjirMW83CRd0MyrXoWo8PJn1h8007tQczYta3SRb2VuFJ//NLXmcrkzMNSy
 Do0AlxW8AYUXzztNx+FE9m2kK5Enc/XiwrryMNnV1jC2a1P7yfcyEiG875o1tGNv9Cbr9EaOTWb
 ANS33XG+LRAGScgINM174D1daJn8Ovuvqbwh0OGUQCU+ocDcZMcnYn6RtoyTgEaJmopMBiABlGn
 bp3vdJtnzyG92wWuLXqpj3uTVFye+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_114013_232414_9F51021D 
X-CRM114-Status: GOOD (  21.49  )
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

On Tue, Dec 02, 2025 at 10:05:38AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> Only ath11k is included this cycle.
> 
> Update the board file for two QCA2066 platforms, and update the firmware for
> QCA6698AQ to enable CSI/CFR reporting functionality for IOT products.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/814

> 
> Thanks,
> /jeff
> 
> 
> The following changes since commit 38c82f07a964e27c3e71224c1f038a4083ff58b0:
> 
>   Merge branch 'robot/pr-0-1764573234' into 'main' (2025-12-02 00:54:05 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251202
> 
> for you to fetch changes up to 15f8543684412387ebfc97a4b99ecd18afdc5e0c:
> 
>   ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-12-02 09:53:54 -0800)
> 
> ----------------------------------------------------------------
> Jeff Johnson (2):
>       ath11k: QCA2066 hw2.1: update board-2.bin
>       ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
>  WHENCE                           |   2 +-
>  ath11k/QCA2066/hw2.1/board-2.bin | Bin 745408 -> 745440 bytes
>  ath11k/QCA6698AQ/hw2.1/amss.bin  | Bin 5005312 -> 5083136 bytes
>  ath11k/QCA6698AQ/hw2.1/m3.bin    | Bin 266684 -> 266684 bytes
>  4 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

