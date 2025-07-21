Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD37C83F1A
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7abZbcTESodIJ9OoUmT0BUOmr8LOHDjD7rgRNFOCTgo=; b=E3B4X3Q8/McxUSqXiOkv7a/iYK
	VxXwNOp2D6+3Z/LJo0xyx85snARXCdXEB6fvwb2rYY98LU1jegI0NBb+/3zgifMKgylA235k4K0lr
	63LY27zg1t/eNk9M5Am4CvocuOLx7tIyRLk8/fbNVOJHjWc0+fYSgRnnSV5BDIiQxy45clRKwlF84
	felElwdc43rF+/T/x+xKV3hO2Uw1QF9LjWuTbS7mFaazwr5329g8lVLey/GvZp/grqrX9NUABHz1z
	7JLpdFBp/hJDnRz9iyPqf7wu73m5CCMaf7Jn2aFEY+UDADFWH4QPHNwmZbkyQP2eJRGPqkFQYdSZq
	JlNugkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyES-00000000kfZ-2KR3;
	Mon, 21 Jul 2025 21:39:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyC0-00000000kCS-2PpZ
	for ath12k@lists.infradead.org;
	Mon, 21 Jul 2025 21:37:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LFT6SA016274
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7abZbcTESodIJ9OoUmT0BUOmr8LOHDjD7rgRNFOCTgo=; b=GbjF8ODyBCI0+lJX
	iTCO53woorPHKXZU6fMUrbk+bMcJWVNcLelAJJojfa9miwJJLHIA9lcIxEU44AJr
	9BgSEEjXv+rW55YT7tdIa22zxiAsTp/K+4nHRIGjnO5ck/pM7Xf3Wgjm/nqW8tI/
	fwX0w0fGniOazwWebxCmEMy18XoRtatJCJIi0J9KNN4csJ+q+b+Qmct4BQSw3xmF
	1gdZlBPSTm4QiftnnsKgv8jrxjOEUlmEZaxCKal5iL0njjHT6PO/9GI3CLfC9Wyp
	gMZH3K2KLo0f+m3vyTzHNOvubWw8iHNb44XsxIxqo8KcEoeVekw31ogGNZ6D1sQs
	hgTq9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048ry9wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747ddba7c90so3977731b3a.0
        for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 14:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753133821; x=1753738621;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7abZbcTESodIJ9OoUmT0BUOmr8LOHDjD7rgRNFOCTgo=;
        b=S/UUV2D3D6lCUJcvavCq1cqsYRvPyi4Lx+CLRpLAOWtZn3PMbNgAblFF+VvNdYFufY
         vmUEQvXf0kJnKiMBxuEUAfyhneNupHz4Ej8x5l/LzPO3qVYEG4CAQeb41VBNTAix0BES
         QipMZezc+G6FY1g0NMSSGGqm8iuketQed7wDDYXHIEQrGI7mahbj9B0Ve9LdCtaBBCRe
         xGchuPrgxE55Ta1lgOTEgyS5tr/NE6hZQV9sZ3s9YQtAriUhzNL+lFLwvVCeRrhLAeFB
         MBvWJbm0eAgC5EaF8DFS9+LBYTendWY3ZVJtk2aymbl1G4i4TE7NI1HnSE2q5FQqAneM
         aj8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoN60qyWe8epc7BxPCauKLJ88lWanGCscp+uPVH3Owy/kUE8YGD4WJCA6SsVtK/BZs1A6sBk8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjctEEw5Ygexddax/kybPmzb62XXCz/kOIqmBBpR7cVrrUnwL3
	SNeYQxKF973NVCY4I7POTgVNRI6S5frD/Mm1+TnIkAfzppvACIx5vrFbnF1LKanELcq2oq606dX
	jaVCFY+KkZiawn7wY9fgSLcXwCQ659VVBp/O1nzF3xDuL50jDDLds/MRnEkLd3FhC
X-Gm-Gg: ASbGncsiUyHgNlrjE+H55neftHe4fBcLDf/RvLfM5IwGD2rMZAte8weboRIpHrkcX1p
	MQzwePiNXzkHRhZXYulRaYHcpzL9sHbbfN5gjBZcCoHe6C1oyxKKQtH+LmKVo//gkGLvutJEDAW
	jmzXGth+DPw1OiWnTnr3KDkKwkzSYAxQCg1HrgxhdwqnITyR3rZGLGwl6ZZ/BEzj3L0NkB92r09
	D5t7kg+G7lYfr2wTl/m7MKAOzDsSpWYZ6LH8r7rhtY9Gs68Ew4/Czu6eXmyQmacf9csaSBmQbuJ
	ELMao7whRhC0zs1YKpx0mwDmqIdx2bNow75rFkvyq0Vw6mFgNmlNzDGVa93L2bdFT5EK8k2Ys4C
	a
X-Received: by 2002:a05:6a21:1fc8:b0:215:df90:b298 with SMTP id adf61e73a8af0-2381245779bmr31469573637.26.1753133821483;
        Mon, 21 Jul 2025 14:37:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGYkw343g7WZUxu1HxpQSVeE9euVt2TTteLrojF1e3zmfB21RbbR6FxS3LgAOr3YIe29EkOQ==
X-Received: by 2002:a05:6a21:1fc8:b0:215:df90:b298 with SMTP id adf61e73a8af0-2381245779bmr31469554637.26.1753133821101;
        Mon, 21 Jul 2025 14:37:01 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68046sm6201934b3a.151.2025.07.21.14.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 14:37:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mihai Moldovan <ionic@ionic.de>
In-Reply-To: <20250721-ath12k-dfs-v1-1-065c31454f91@oss.qualcomm.com>
References: <20250721-ath12k-dfs-v1-1-065c31454f91@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: bring DFS support back for
 WCN7850
Message-Id: <175313382031.971667.11294209028477002334.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 14:37:00 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5MSBTYWx0ZWRfX96aEMzSiu7sO
 rQAJ5msIiyaCE3YmQ9JL+ixNy4q6MiW2u21koKiWB2yv/64ljQsGBYLbvG1E/ZMKJC5QJzN4Wuo
 fNNT+gkS2HCmOw3HBD5RjQbBlzCx4qahA73wAjS5LaxY8IBlRrO542XZ9eeGpiYEzSWYKheh3MR
 idGBahDt+lNrf2itKN6q56I/wpHxx2aDr+WTd4uPk7653jX+fjq9SxaqJ7f6XrKMKdhBHYLO1b7
 sihgn3YoQlcwmfo3xpu2xgYkwWJRGEFhC0k40xo6POb1Y1YUD9VIWLafAV1Y05Jh3wWPXRknap0
 vmTBNDf9A7c22b0Cnp7oAUBQ3Gt14AtK9OtWYC0yEsp9UN1+WRDmBcz8WwCY4p8e5LXENA8nzwO
 hACjSubVm6sIrY4LkZlBTXMGBzgRhFA8a19B2UfjFTK3HerfMLlABpUWWUVApPb7A8PaQjyk
X-Proofpoint-ORIG-GUID: nFZhYsWmi_BIhwOzgiuQ0D6B8a_QUcnr
X-Proofpoint-GUID: nFZhYsWmi_BIhwOzgiuQ0D6B8a_QUcnr
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687eb2fe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Erv8aaIZ6ZqwiAegtCIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=904 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_143704_734204_0F34F555 
X-CRM114-Status: GOOD (  11.63  )
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


On Mon, 21 Jul 2025 10:27:26 +0800, Baochen Qiang wrote:
> Due to the restrict in MAC80211 that DFS (Dynamic Frequency Selection)
> can't be enabled on multiple channels, commit 176f3009ae59 ("wifi: ath12k:
> support 2 channels for single pdev device") removes DFS support in order
> to support 2 channels concurrently, making AP mode not working on DFS
> channels [1].
> 
> Revert portions of that commit to bring DFS back, and add a new
> combination to support 2-channels concurrency. This is valid because the
> MAC80211 restrict works on each individual combination, but does not care
> about them as a whole, as far as DFS is concerned.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: bring DFS support back for WCN7850
      commit: c4825d540f4beb179d552f3aa1f44f8db5095fb6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


