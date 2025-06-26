Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9A0C7EE3A
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCmAE4vAUTYfqGxjNQ/L/Y/x4AK5ePy9reGNlC+lbEU=; b=nFof+1nDNvj/KiOsKuvPlcKJ0R
	4le4ZLIXG2qbO1bhYr6lCp+BGo2kRaOpWXTSGvJMUo3Z9vEJFHG6qg7A0Ek68KttBhlqsXLQUq9x8
	uoHaG+zJHD3hHCKQsKGCFCHo7X0m97+OjyLBG99vjRYNB6epKVelHOcz5MwzPtvsQINsEkf21daLS
	xdldrLXru5pDNUwBcUQc3mM/W4SyMJG0MBN+TK/8ibRNRjAwtj9X34OafqoKosBoTeMhPWUFmvT4Z
	eryjpth4BL/kcg//82nzKKuVAFrunSatUjMyo3sYIHs76VSfn4QeGPatKwBXfstKoxJJyUmslAnBt
	DmeFKHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuR-0000000DCNp-0i4X;
	Fri, 27 Jun 2025 00:25:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoP-0000000D1zv-3Xt9
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QI4bDl018610
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NCmAE4vAUTYfqGxjNQ/L/Y/x4AK5ePy9reGNlC+lbEU=; b=h8S7ldVax3fWwCiR
	nXaNkcZO0ZF0qpABXHMcusLat2JevP6HzrT2MGV+H2JZkXGP3e6GU5To1rVZeYFy
	GPOX51C4XM0BEOwIlFg+uRzscrTZG/KayXTYHa/5GizBB53ZBSTM+b1n2dhnqW4k
	hEBTjkzLe20ZGjhhNKdQWiBSxPY8tU9NDv1BBZWBnPf+jE8F0uR1SXv3MJwqluxb
	OBwKWc8n2dqO1ipPPCz+2ZlIUUuJyiHS5XgbASzNOHEJNnQRa8QP4za811jO+x82
	NwojnkwU5FLNI8N2PUUjxnSX3M1hdmXRkFnrDzBU4m+69si/xRZ3L2FAMS25P4tn
	qHyXIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26f64m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-313f702d37fso1283032a91.3
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979721; x=1751584521;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCmAE4vAUTYfqGxjNQ/L/Y/x4AK5ePy9reGNlC+lbEU=;
        b=uvkRXGu2NUKSfIjS6RlzKxfT2xdA/+dXbtVSnCujazF9j0NcyqgHMTZyIjwnX7ZuaC
         eunKEzSpzU9hBgej1uNDJveV/uo3p8wYXAQyayoDadvEtZKsyBkKdpqytBDxFc708xdw
         M2JJnPlut8cvxqipd53n1j703vkgYn+YuQrAlP1Z902XiEDeE1udYUX/N3V2Vk2CW0VW
         SxRGYsqa9apEPGkktHwb/tqtWfJQld1HGBslJusMfQgI3Dj2JZUN4qrFgFKBvZDk4hxR
         ZLAlH6LO8jz1oB/CpFQ8bOeIAfEFAN58JOfSLhXwvAVIJRlFM0GtMpAYg+Jk3l3eYRCK
         dPJw==
X-Gm-Message-State: AOJu0YxkbCwNN/Fp0WDDv1MgDiqljgvKwxujeFO4ZsR7fOCvmNPUd/tY
	fZODzFY7lxg34xHCKsVUF6BeXvWhhfTkSXVmwssk5RcKRhWI+nx/avq4aIzHrkuAt+bQuchvEid
	hlpwrtFcg4ZJo2IjckVJDSgFMveDUabsNWhY+ara73VIRo4Ic71UxF9eR8bdj/KSa
X-Gm-Gg: ASbGncthhIgcpoeRaDaFO1lV6GqyaSfboCqlz1GpeQrssmAqk/kLf0pVi38cDXWMoKZ
	G8O8sJDnxwnjbUQwBatQf1j32d3cWVojxqI4gxFu5Vg5tVxdh9b5NKNVwwOFB6ryI1mjXW8b36m
	pRXM+o7N6RHqUIkVj63mS97ZRm4VG1rHuwm3oukRqxmcUVmVGWJNSF5Ob03bikJH2pZPoVmBxDC
	WhbroXqpsZMt7ULD+Dy7XKML+hon0mchfrPbYo0ffNv2OFv7xtlJKn6ch4FLn7CsWez7kSFoU/Q
	864pacsZEIH2YfzQt++hLZDD9yuUmR9zt6Nt+vFTk9ia5oL6YgAnHhl7qv0=
X-Received: by 2002:a17:90b:3c50:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-318c8ec3a7dmr1314717a91.2.1750979720630;
        Thu, 26 Jun 2025 16:15:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzktJw/3vnYkuK0cx+q6CNUeuzwTkm3RxbcArsj4cl25qctu5smOg1IXkjMzGzn2AWIoteyQ==
X-Received: by 2002:a17:90b:3c50:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-318c8ec3a7dmr1314647a91.2.1750979720016;
        Thu, 26 Jun 2025 16:15:20 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:19 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
In-Reply-To: <20250608145651.1735236-1-ramasamy.kaliappan@oss.qualcomm.com>
References: <20250608145651.1735236-1-ramasamy.kaliappan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Clear auth flag only for actual
 association in security mode
Message-Id: <175097971940.153431.4490704491841906367.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX+ArQcE0kEmBx
 5fXaBUo5kqKy9MWP4/TnPXE0nlW30e4UZUyp4UFpXo8v0jc9F+YuJjcwziUXUJw1NHBAZ6e0Jbj
 piC9eACqEcLmRK3iAtW6FwWkyUHuuSe3Vc2g8iiLr4pF9ouKORwd3ywYbXOuWUai9lmvId/xS3d
 RuBRuTn/rFKFz/R61M8OCeb0iYJYjFCd93e5VnafbvzyEmORXaV8jNxjefQvIId4h65lK4Qyfbo
 OQkfB32ChYZM6NbmFGVwkfMckZQ7C/A4KVt26c/wcIPnywkZ7DAwKRy4UcGxHW5WSGhheguWzoN
 ySb3woU0gXIfYnDAAVNGcbuosnv24qqbtt+Phgz7DZXOwkSt/fHf7Kk20l802m6BjFK+5giHgmC
 2889x2ibL2srR7kYggedaeNg6eTSqCpQKXAzUP+iPOBsQzdyDVdQzoyyMFHOxSr1rcLTpzL9
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685dd489 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iL3hp5CSDfIOlDBT6hoA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: pF0N_jIjll9DcQuII_PKm385VnMfEP4X
X-Proofpoint-ORIG-GUID: pF0N_jIjll9DcQuII_PKm385VnMfEP4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161521_898005_E51B293C 
X-CRM114-Status: GOOD (  11.34  )
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


On Sun, 08 Jun 2025 20:26:51 +0530, Ramasamy Kaliappan wrote:
> When setting a new bitrate, WMI peer association command is sent from
> the host without the peer authentication bit set in peer_flags for
> security mode, which causes ping failure.
> 
> The firmware handles peer_flags when the client is associating, as the
> peer authentication bit in peer_flags is set after the key exchange.
> When the WMI peer association command is sent from the host to update
> the new bitrate for an associated STA, the firmware expects the WMI
> peer authentication bit to be set in peer_flags.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Clear auth flag only for actual association in security mode
      commit: c27bb624b3d789a337df3bbcc020a575680555cc

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


