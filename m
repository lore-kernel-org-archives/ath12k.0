Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4068CC61CE7
	for <ath12k@archiver.kernel.org>; Sat,  7 Jun 2025 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AJoV7kJK8wLd0qFjYQ9a0bVzN+q1YKr+TdV+FiHH+8=; b=Wa4q3Xav458tMC2ozIj9TXB8gE
	4gj3ao2mo6ta6zxIag7SAJj0pBLaOEOy9l04PeondhuEWQLdek5BAySRoiGKDCBwwn8lidxNSdsYw
	N/dWXfZjw2/WRHVVYF6z1LuCupQ8n1Ga8/UXC6bcBJ/u/Bdi72XvFX4lVpA42SSTc59kmr82Ez18p
	3/lYJoxWAijMZFJULuz5et+CczwgQFM4+zWArWtbShpcx7YJtQIQjUJtUzkrSeTPY3DTcrYD4me1K
	fv89OzUTrM6hMt5G8SRaR8CBbuCGZ9sd+PjIT8/0ibESJGalTsv6jfLAIA4ORvOvtqtB3CdIxJx88
	jqhu7iTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumF-00000001mPU-49gy;
	Sat, 07 Jun 2025 14:44:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumD-00000001mNI-2HOb
	for ath12k@lists.infradead.org;
	Sat, 07 Jun 2025 14:44:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574e2fl011750
	for <ath12k@lists.infradead.org>; Sat, 7 Jun 2025 14:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AJoV7kJK8wLd0qFjYQ9a0bVzN+q1YKr+TdV+FiHH+8=; b=FcD6bmaDgt/ua2bd
	ZdQdUHNg2LPkXbU44nxJvyiOwq4V0s+KKBcmsGsNFAc1zycL27/UntEhij2/mkhF
	D+/SHsEeIOAnuvBEVH11+Xhhwq993dv5uQaYhdgyOPcwb/7g1vNbTVeWPz+wSVZU
	S/OeBnXzrtq9Sue0CPbwEWLtjWxand1q2K/8O7pIDaGySrfX7NgnWVD19JlXtoo9
	AM517xO6iJ8JfdpzeifdgxqrVPHtwr4gZKqrhxW/8LUnzuKY8VPzrH9BfD6Xnvbo
	cCDe3Fx4tfPzx/Epmo0MyJl3Lm/YXWfbKpV6/FQBjw7CKclULrib775US3AYHTJG
	EohoVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpgmtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 07 Jun 2025 14:44:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235dd77d11fso25259765ad.0
        for <ath12k@lists.infradead.org>; Sat, 07 Jun 2025 07:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307443; x=1749912243;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AJoV7kJK8wLd0qFjYQ9a0bVzN+q1YKr+TdV+FiHH+8=;
        b=kMIqcOZhWQJYxhE1U1r4LJt9ILCEmP4mYus9J99ExzfR8nC5DNbGz7AUvlutuGs+lD
         iPqEXscigYgUZYeLjN91bh3o6JXdgK1O9pZyOQ0NaBnVeSG14O7aa88K7IfRG8EhyUhu
         ek6IMRp1BdVNhI8yZJEDRuje+9w4KqXYNGyknVUOgXDTAgQNS2fLW5C/BVduMAhI6d7i
         UNESixmoHv6iqGcj4jnwpNt6+oaHUC8lJbEwl1y5dSvknKNOFdI1U271Toieov6lOhz5
         d1gD1uHewIrN0dSOpaEowLIx1vERFJBi7TXceWmTS8bjhMvv6rTl+TKoYuBtV7ZD0QNA
         UkxA==
X-Forwarded-Encrypted: i=1; AJvYcCUVCaDTiQX9lj8E2QQQfl596mYTHSdX3vMV40BAKz627x+y2nz1mwWH/qvJ6rZbqFebo+OuDWE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWMuN+TOu/s3p+bURNRXzdiYyi8pTJ+p9rd18nI6gzRAVmMN8y
	5DXAz1+RViO8YnbYhSwJlXtj+Y1fjNQ8OwOJRbzKzpNPDzv7In45CnGG0a+l72YUJCp6t6lvm8n
	UOmqYOaiSlFPjeYbgLkfp61suWCQEIN5QCYPR/uHrUEGEAV4al8cxIBQo8vdBXd/+
X-Gm-Gg: ASbGncvs1521LbV8m2PJacEoYeg9ehEECrP3z00xZm/v2sbO6Yd6x8lP+eMpIvBkIkI
	BFmD8C1RRLTsMPEqxy76FLhrPgO9l6v0gbnRLfmiBnpbFE3YWaX6yxS4hphPJV0ABmbbd69mgsz
	Ezo+Wp3FsL+XCHMw3zkOeYvtD3LUl9ChWp7UqiNHky5ohQuv4HvtOPETcpNyfEU8wlh7P1XIm/c
	AMlQAWd30T9/0cGrTs7R/WT6NCUIYO6XQu2daLI1/PTIOQfLjEHWowJiYJATBlyJ06LqVg5IXNl
	PScDDnRzabUabuPDEkYH5bH/sPqpS0Ryy2XiSfV56tl5ai1Y
X-Received: by 2002:a17:902:da88:b0:235:129e:f649 with SMTP id d9443c01a7336-23601d01ddamr113333285ad.12.1749307443229;
        Sat, 07 Jun 2025 07:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf5t4bZmgcbYoheZ9gcH9Maf9GoA/v2OUQJJJafoOCAMV80dVHYCz/9D7MSymX39J2T0nWVA==
X-Received: by 2002:a17:902:da88:b0:235:129e:f649 with SMTP id d9443c01a7336-23601d01ddamr113332985ad.12.1749307442864;
        Sat, 07 Jun 2025 07:44:02 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:44:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Sriram R <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Parth Panchoil <parth105105@gmail.com>
In-Reply-To: <20250523-ath12k-wrong-global-reset-addr-v1-1-3b06eb556196@quicinc.com>
References: <20250523-ath12k-wrong-global-reset-addr-v1-1-3b06eb556196@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST
 definition for WCN7850
Message-Id: <174930744132.154748.8693669637865725058.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:44:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68445034 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=17ir-Gtp1zVAAPY-F3MA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfX9Ob00NFujq2g
 0bN3RWsICBK6PHeN6mfDneN+n0/Rq4fBjxVh+Hmwe6jRCo6+P7g1AJq0sLRqj8Iocfyw2rx/ZdG
 XPF1NStYWvkWmW6y/uHtqS9TYmfERHpBvRNLX6vb3NDeU95RY2yki5OfFYod+w3UFZaxwzfPdeB
 hqK9RvZL5TYzrlOuhp9y1cIkpyvi32tr38P3ye0Zoqua80XJzJ9wH4kxB2z58IIkG/kCzC+ZhlG
 /8sYel/QrVBDix/VZIMZ49xLz0ev+nPn8kROad6JCsd3STMVD2KLAvb3InZX1z91KnrVWAHtHrs
 FgkTbsMyT8VivhYNnw17/jSWcLgbqPqJfAbY3o/Q7kFXXw/otAopx8Q06H5cd0FNUfnKMpy7LMs
 y2LmzSYg3jEOiybQ402Gkz8Y/IBqsnDko8gesbyh3WIGT8vai8zjeewbgWr0vbSbDhvZr4lo
X-Proofpoint-GUID: 5Cokoq900uUWtjFJTULv2LGfJeeb0PSd
X-Proofpoint-ORIG-GUID: 5Cokoq900uUWtjFJTULv2LGfJeeb0PSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=718 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_074405_593905_6E82F3E5 
X-CRM114-Status: UNSURE (   9.87  )
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


On Fri, 23 May 2025 10:23:05 +0800, Baochen Qiang wrote:
> GCC_GCC_PCIE_HOT_RST is wrongly defined for WCN7850, causing kernel crash
> on some specific platforms.
> 
> Since this register is divergent for WCN7850 and QCN9274, move it to
> register table to allow different definitions. Then correct the register
> address for WCN7850 to fix this issue.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850
      commit: 7588a893cde5385ad308400ff167d29a29913b3a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


