Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7C4CCF9E3
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 21:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zVQx5WyeH2UAU5jT2Q0oIBeHwoSDCmZiyBcYaM+hFo=; b=sBKBXRJLolX0wAxGd+MVQ9ncpj
	Yi6jVtAHLpYNWRdNrNoE06NMM0PGvsYH7vvDNXjYxPxAuuuXBBhE0/vYoUWWkN6daeisNYyEWY1Bg
	kZmr4ppdsRlpsP3YFiAo31ejFPEJZ12z3QdnzE/MftNzDl6r6AOcPrvh0JH9T+07kK1NkVRBJ6Dlz
	HviVzEdhvinaTKo2n/YIAPQudFCrL2hDSiW02mh4PEAfyhHz3099G11Dfl2iY7GoHj6S+tEE43blr
	svolD0nbwLjBQnnB5uyx8BpHTzaJDI4glyv1WIGPlWGtLPM9D1UlX0nA8jPTpcpjLvupA0pSe4Er9
	bNFMltDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeY-00000004zst-4A4l;
	Thu, 30 Oct 2025 21:57:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeV-00000004zpn-2dJ9
	for ath12k@bombadil.infradead.org;
	Thu, 30 Oct 2025 21:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4zVQx5WyeH2UAU5jT2Q0oIBeHwoSDCmZiyBcYaM+hFo=; b=iEXlOh81TU0arNTVCync3Pc3tK
	hwb9phC6EEWdTvb0JI7fRXQ0FW0V4geNBq7Lz/npblqeRY57mBV6PJS6xM9ctqOvD8gKLzRQHNDo2
	66o0R6oJdzMxKFPmwepBTnrqIC8T98SUHfzhj1xJIw1cEx3Pl4sPLys0uuBaW1ofsFBbIKbmBAsCq
	RnltQA+J1hEbSJZkzs9tNcSelfp020xyU+6oEd3IZWZkm3ogyMOAmE2M3n7bjWHRo35o3Om+L6tm6
	qTS9ZGGVhRqmucqhFBZ+jmjqse8DX+I3SvyZlYb1qwCvqHYHHnbZvIzpgfxYOQhEKEkqsT8mYWXTm
	RgqIeMbQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZmh-0000000A5JY-2LHh
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 21:02:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFEWdF084097
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zVQx5WyeH2UAU5jT2Q0oIBeHwoSDCmZiyBcYaM+hFo=; b=AZx8gCpEbfkbjHtW
	31L37iGfRjbPiS1WnlvgqFB4J5+dKSnFprThKREFjtuHk0sSrYQ7c7AEF3Q3H6oJ
	5RDuWhDhMoJJSKXlIWvfkO3IF7vvxn+4NnyteevFNt8aPlU+tIWQzdYP+NPrl4Hp
	vUZrJoIUpe0c3xrkQnPr9sWH0+1mJ/M2fMRTd1oV02g/CRIOIHICrqQTXqBh6A9v
	0gFu8qzNTT5gw3x/jLJ73+WKPnsBxFOmEpdfqJVMMXh8NcAgELi2uj7gc0aNMI8u
	dJKOpAF7CoAs968EAyo0vtTo+1m/vP/rrqDK9ZBBHoxEdsj7H+pKfAlRbF/CDDAE
	Y1+WeQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ag393vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2697410e7f9so36671765ad.2
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 14:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761861461; x=1762466261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zVQx5WyeH2UAU5jT2Q0oIBeHwoSDCmZiyBcYaM+hFo=;
        b=GzfmsQ1Bh4DSrHp+jez8JNx4iCjMQsvpjEWPNK7CpvEdfFlO/bhBBnt0R94jjC5sI4
         e1ezrBPdTsFA8rl9gJMzNa1dQopZlhYlnvXh53zBapdo+VTVIbanpIPC5WTksqH424pb
         f+w6Ct8mYUofv5UNsZInHo3BZ7GIf/WTUEug/eAMslAa63+EjvOV6iZBswB62B7S6qVF
         lAbh+PPMXOXXc6tP7t/Ps6NdsGEOAd7/Cgp4A9ioQLeJqDBr0kEfPRlH8NQV9hqCPGY9
         wjFKswLV+31YQlUdl7YimkxMOkkTi0KprbJx+tIWDqH1zQnsraueQA781pdmxy02OWuD
         YEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861461; x=1762466261;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zVQx5WyeH2UAU5jT2Q0oIBeHwoSDCmZiyBcYaM+hFo=;
        b=G+ePBry6c5g8Lrh9+iznmfktfOztDjEWHmN2y6pvlTr5D3T5CrKCVzfNsV1mDNtYGi
         0fB5DgRd1AxdCjGf7/iCNxf//jsaKoSqsu+hZdHkba5SVXTdlHKCWKmhwpCzaTiZGHZs
         DiXJAgOKXOqSraR7riWsyxZ94iJyNMQw43exuWjkfIgGmH1kROHHFMX0YSqYLHcGJV5j
         xpzdbKia/ON5zbRydzrPhmtY9ZMBSp/yt73oap7nZ3UvIEgw3OtuRHONSVor/IJHaA1S
         p2g+StGXb83FFs75vzrwtRdeYFwqTfJ7mYkiYBrLVq9XzW0A1yoNC2NSpx9jQivC6qbl
         JZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXGuVfjwjccTYKVpmcOsFYzoomDRmcTu2mecNaWSGncXTBmTHM+JG3hbq8uaeJLnwVR0NVRiI0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxP7/oW1nsUF/Bu1y8b1j3QxdlFFaWdutaxKkQHVXkuswRiP0R9
	EJR6pLGEC/TFbBd8vnX605NAytBb/IQMR2Q3mUzcquNCQKOf4VYK93tjGU56jrJUc9nuII/GeRQ
	i0I4BqZ/yag2xJ8tRaj8k2+vfdXImExwPFK9hJxt2OFitsLwg6rDJSF2DdEqytU6XvGhVh6Ek
X-Gm-Gg: ASbGncuBzo/9Xd2jMT3IJmvpRK2laqIpUCVsWyjIPAbMbQiVItbwrqR1mIRcUGB5ywy
	QyVTUKWGGGoK0xZiu027DP+cjNZDHvk/XYpG1SK3TVQPr/qKiHtfhVEAcBGO1Mct4MTxinhE/lP
	c6bHOT+Hw/iDuiGUX5fkkh2Z+gA6yAzU/27fDr7Y92QqkmwgHVik5QeX3gdUBCIgUKsdV5hpuRY
	1HQWRIiQ1JcB6hKF15ifZ0UVx0oQbdyNz4V2qWdECgNeZzKRTgTeqtER6OBiyIeQx2NxJ6s68pQ
	V1cIVgqrFkSixEjC6bULcYjkGxwjbFoeeGwMiNXd/5qUeVNzBmy44lPQmaaaY9VxsAeysbdkXD8
	c2t1NUTNUrLKXI/GsteeQaw70nKeL2UsD3po=
X-Received: by 2002:a17:902:e84f:b0:27e:e77f:57f3 with SMTP id d9443c01a7336-2951a38ba2fmr15385725ad.14.1761861461356;
        Thu, 30 Oct 2025 14:57:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD73qzIAWPxOmMRVfoJk08Tp+r4nsv0hmco/JUKkLJEbj2CcT8aUy6zZiTi/ldv2k1xxnFtQ==
X-Received: by 2002:a17:902:e84f:b0:27e:e77f:57f3 with SMTP id d9443c01a7336-2951a38ba2fmr15385515ad.14.1761861460871;
        Thu, 30 Oct 2025 14:57:40 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm201868405ad.6.2025.10.30.14.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:57:40 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20251029-ath12k-fix-m3-reuse-v1-1-69225bacfc5d@oss.qualcomm.com>
References: <20251029-ath12k-fix-m3-reuse-v1-1-69225bacfc5d@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix reusing m3 memory
Message-Id: <176186146024.3489476.5551285791911221420.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:57:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4NiBTYWx0ZWRfX/rz4j7CerqLY
 wLj7BgBeuDV9+vgb+Jy50Y4KuL4NXOPZUqcb6EF4kkTAft0avp4jCKokB0q7Jni+IldmeRbgDIK
 1lwwytW6WTRIKmDnu56pt3PmstZj+sE651iLdgYz/V3jtnsC1hPAjJxUP6jNjheklklZLH+CWtS
 DTTdDnDfZOqpE35IS/whPPgMbRgzS+SNGnqrW+xSOdl7P1qBuh25H4qI5FetVh8AzxADS6vZ+mL
 bITsHPA3SZ5ckt1J4Jp6GQ9e9FGu9B3J2TXTljZS6YXuFhuHUFAHua5TnkArkvGjw/MGSiSaF4x
 gAc6uhTvjwX4e6jYpkpvCjgXMU+d3GcfNKIwsMnyJRjAYXEnUTPwcEfvOEeBMQBbuJl0QWw11gv
 pW3lfOoZPiNk/pGo/KfSQTT1/iDZGg==
X-Authority-Analysis: v=2.4 cv=TrnrRTXh c=1 sm=1 tr=0 ts=6903df56 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y1qFtuX8SmuMirZhVQkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JzRSELVbbUUHVZd9jo187Dh2Qre8wetB
X-Proofpoint-GUID: JzRSELVbbUUHVZd9jo187Dh2Qre8wetB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210216_320520_E8FBDBD5 
X-CRM114-Status: GOOD (  11.41  )
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


On Wed, 29 Oct 2025 10:07:14 +0800, Baochen Qiang wrote:
> During firmware recovery or suspend/resume, m3 memory could be reused if
> the size of the new m3 binary is equal to or less than that of the
> existing memory. There will be issues for the latter case, since
> m3_mem->size will be updated with a smaller value and this value is
> eventually used in the free path, where the original total size should be
> used instead.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix reusing m3 memory
      commit: 00575bb44b2c2aa53d0a768de2b80c9c1af0174d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


