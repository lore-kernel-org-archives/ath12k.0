Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A8DCAC5A7
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGhKWo06xdjZ1sk8lDnAZ11n0wQycBWzDYLA/JUlzxc=; b=DoysPENQFQkNq1fdjizw1Ep+4q
	1hB3aYkpCnIgvF5mrie01YFVh9xiS+6CIjzkwvpACdaBDmszd5/cP7i3hD2mhyG1aH7DRUBp+9FYT
	2NDQH3nP487GyiPNq1w5Gfn0sc0quBw17fQzpIaeZMBiAkzfRz+y+WBYuB2O4frKWj20Z7W1NsA2D
	/BOPaI6IgS5fG57EvUd5H6JAkNC91U96I1EsPCcxhd69WVAzt3tdm+S+Sl/wM2wemmMKzmmIoAkhJ
	Au8aoTsIzLM4PPITnY2WG0xy6vcHNhZZ5bYO+Ey71otN2aDJF3yBpGdE/DPjxEdIfm8G8G9Jjfxu7
	+m6iyaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLX-00000001RkZ-3GWI;
	Thu, 18 Sep 2025 23:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLU-00000001Rie-3SPc
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIGNiG032465
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGhKWo06xdjZ1sk8lDnAZ11n0wQycBWzDYLA/JUlzxc=; b=RJvILq70UFY9u+hN
	ggNWmmvUT3e/O1/W+F+WiF1U/lUOkYNiU/jhnmi6L9piNdrov4I8Iw5yzGqJJkhX
	XnCDjmN2Hrw8vdMokbROXC1qTWAZ/tJnEZ70VtTzKTcabsJLhAULP2CV66jqxvlT
	scXp14OszAAckmaKfieWnFHRmTA9VgWKvkj35ak+2obRfebfv4f9+PKwoHzhkCU8
	gLRujYf1T1aBv6YY4WBcdVvFV3Rep4Qhg5xwKCzJU+gJ3QnrCW0JlLDzdvXJ7V/N
	4rbCHo13ot8MreZkT7cMh5eCoCTCLu4BLpWM5EQNxzEmgacpIhCW2S1XMkduK40G
	fd2+gQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyrd2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso2133260a91.2
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239243; x=1758844043;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGhKWo06xdjZ1sk8lDnAZ11n0wQycBWzDYLA/JUlzxc=;
        b=t4daJ/wsFGG6hWbORIpxkL5ZqVpkslWNtYzkoyQscSYN0c2w/2dtz4Kh790aE7Jxw2
         Dvoc6D2EuHGZHAz6dLl4yRnBHeDIdQnPTeDN4oIQOXuVQSyWJjbo+/aRlN0xQF5Yn7PW
         2qEEjkla2y4F2QgSXGvVdxb/Q7lS0JPAsk3nhDEAE1wAKRgfg8NXiWdSRiEesocQ8zSq
         XUvbXuh6HrQI91WIVL6VCAZBMWEvos4zyS4aM7YqE0Fi1CXROIB6Ya7XTPYTWuKzYk6s
         ihc/fmlDxPHR3zS2d6E8eHGbdqYkGIFm02OPD5MutcMVFBhNeuYTqXkMrHMjeRO5GhuA
         PZEA==
X-Forwarded-Encrypted: i=1; AJvYcCUAmWcV/Dt3IWapPT/rOtXpcM4kUwjOCaOJjIM5CDZpCVIqPxwE1K6wwl3u6B7HlIxn5OL6V9A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3UjKOghPB3OGghh8o5dQTEjkGM03Gb4XDA8ahuC1zGha2lF+d
	xEz8wJJ02ZdiNgaQ4ySQU7SM3Ghr0MLj26rtA6CigAKfkez6olbsnUumBrUZEBk8sITHXguU3C8
	v4vyW7QowmtQ/EidmOhs9QgkpEOiVzfoIsgqkEeELWNYnY7M7s36i3rJ+zdvmWbZL
X-Gm-Gg: ASbGnct77xEC+BqQAUVUgWWbhGZu08yZGo5XhoLpU5qxPHpwanKGNkNx+zSN3KgjfH7
	1YYrJ8684HOBvBAmUolvMQHZH/t84sRbrTIgJej/Id3ek22hfmSX4wv6oEqfbz4dH3K04xTjKQ+
	VHfWl5RlLZ0iXFcRduMF4r51MrqJBjoelw8bf/dQCoBEZ+OQ1B/nvZlmco/WLkZXxlG86d+Kjq6
	rvkkFr5W88BXsUYsHl6ReiKh+4hODc04fKJ/HEX3sUNDzlNbVac4SRYbqDPqctR2KwB3etbZCFq
	VbOJQPY6+5urD4Tr33Q9g+co9JLDA8gQB+nBRUJmgWqawpqJutiC68tSfcMd6W0Xl32TruZg0JM
	B
X-Received: by 2002:a17:902:e806:b0:263:a2f7:60a0 with SMTP id d9443c01a7336-269ba54f32dmr18333075ad.48.1758239243527;
        Thu, 18 Sep 2025 16:47:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS5ESImz9azKWgPEaT6zJE0wYFMba62mGhYFWVz45LYnnJ/jvGx1WRG7NesaMARFfeVaFrmw==
X-Received: by 2002:a17:902:e806:b0:263:a2f7:60a0 with SMTP id d9443c01a7336-269ba54f32dmr18332805ad.48.1758239243126;
        Thu, 18 Sep 2025 16:47:23 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:22 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org
In-Reply-To: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
References: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath: downgrade logging level for CE
 buffer enqueue failure
Message-Id: <175823924196.3217488.6845685039081313219.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cc9a0c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TpeBPK0GJKfZ0rfD3RcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 5dODQv7XUjnRlKIKa7Os-DX06yRusHlD
X-Proofpoint-ORIG-GUID: 5dODQv7XUjnRlKIKa7Os-DX06yRusHlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8wMW7jsB4psc
 79QLfMvfaBLcg5uL1ZEKwQSFHczUVmxHdmozbutXU3Ipks2NHZoUo1E/5zgE7Yy7HR3gH3fIzz0
 p6IXMofydJ4DoiSB656P1yU2pOAbFR3WmVEzoML6ZwTxw/SEWXAothN0xGIlQMqMVISClchkXHW
 cbdrXyVm1r1O0iq0Z5/YSEA2i0RfZ9TGjWaP+bbeKxjLzi/eGFYneUlvK90Bx7PSD2gjUbA4UPh
 P4gUcPXEvQiPAyYPrawLGCtOCrgVQ469ifAYG1QRSkj9zxKuJax6S+oYgpf1yvNIdxyZyPFX4IE
 hittOSnZf14fvnDEOZmEbJUYVOcgBxfcMASeYMOCAJpnicv2m3H7EcUgFQoYMo6lq7bJ5af7kLS
 LUSudBJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164724_859552_B1544C06 
X-CRM114-Status: UNSURE (   8.27  )
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


On Fri, 15 Aug 2025 09:44:55 +0800, Baochen Qiang wrote:
> The CE buffer enqueue failure won't cause any functional issue, downgrade
> logging level to avoid misleading.
> 
> Also fix an incorrect debug ID usage for CE.
> 
> 

Applied, thanks!

[1/3] wifi: ath11k: downgrade log level for CE buffer enqueue failure
      commit: 541a201e9f46c6633aa1a08df4ab17cc7c96bf89
[2/3] wifi: ath12k: fix wrong logging ID used for CE
      commit: 43746f13fec67f6f223d64cfe96c095c9b468e70
[3/3] wifi: ath12k: downgrade log level for CE buffer enqueue failure
      commit: 8873edecb38888726ce411b32de91b96cf41bbdb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


