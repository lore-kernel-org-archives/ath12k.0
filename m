Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C0C606A31A
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=24pB0DfK;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HnpWCIY1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNA5wnMi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kovbbk6loTr0hn1v5TMoxCLs3KlWkkhMntV1tVmNBmo=; b=24pB0DfKFN3jQJ
	pIfFNLwbYjKNNYFcoHAmXye2EtxLbZKVU2W6/sDpuu2r55yAAqYl3u+/m02hLhqO1qS8il+tLmi7F
	yJOolZKC7/bK/7YQm7xzNY0uFzEWek5ed2mpZo2E3CoFu2vwg9PWSOzEDOFw1bq9TaPipz4C2dCQe
	7G789HgeapRYiqVeifQHpAmNsjjaReB18+LoKYk3UPlyXVbGTH7hmqUmy56g1SrOmMyrntKX2b5L5
	bxgjTI7AugwUBtvbx0N6Kn/RqIRsiEJIwtejZTFqhfeJ0GXoE52LNr2sLWXEajVYR7l+BMEccJHkR
	MWIoEqQ6CXz1uUEmZfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ2b-0000000AVkO-0evU;
	Thu, 29 Oct 2026 22:56:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ2Y-0000000AVja-0NDV
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 22:56:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TLZWo01005058
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 22:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kovbbk6loTr0hn1v5TMoxCLs3KlWkkhMntV1tVmNBmo=; b=HnpWCIY1ECpy+4bI
	+DWyNZONjtaCnPuLuU0IKZG4Jb/OAyW65O53Dqbt5DVqiojEi6K+uzsvW+h3no2M
	4mmyAvnn4HrGam9QF6M9vYmP9mTJFNCDe3pNZ36bLVPj9NjTGg6kGhmAj6r7PkxD
	f6VSlMJuPjlmb3ncsmMsfJ51jh5177l4pzY3EuPweSv0CYMWMF0Tj7/1gCPnB07f
	k4EM9wSBclJKkCieARFNnDFqGyhJRkF4Pdp4XtO78VnbdQdztEY3XFx3D21Q6Gsc
	U3MoagN7z3PEUQm9V92nWnVRm8EYT/KAjPMz8aV2kraLl5YVpXVnvyLmnB81NrXb
	HUtdlg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qg81p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 22:56:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso341725eec.0
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 15:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793314568; x=1793919368; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kovbbk6loTr0hn1v5TMoxCLs3KlWkkhMntV1tVmNBmo=;
        b=dNA5wnMiEhADm5FSYg3q8pORA3lIbh0ImoZINmPDlrWinVuB8n+WFguZb9jtk994+T
         jVO4/p0zmDDBIZVQfzwkfSM4hXu5s8WfRUDBmJmFClkrBBLYKdVg7o1hF7j3vNPjvls8
         de/LhdKQRCedueU6c5i5ThQhW1K68olSbHbBVhres/VcD7BgC1RuUXXznJdutVBJEhMx
         HJ3J2Iiz23XWnYRzmfijyMT81tEqS4BV4ktPAOHgmc+RMqYFa8cQvVUmtcueyogltjIC
         ZG0u1ZX8IXZDOAqhuf+KCJnXtAi7YthR1RaaKY8oEtTUCIKNppLhHoZmIK1rASrgHLGr
         bbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314568; x=1793919368;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kovbbk6loTr0hn1v5TMoxCLs3KlWkkhMntV1tVmNBmo=;
        b=PoGBCtCrYl6XO2wPteFx9dUIK+2lZkUhKOr8aQOKBmCAci7mam69TYamT4dyCqdo6Q
         U6M5GR2zm2d1Olp1w2ElRxEJQj4/27FTAH4z9PzIismTDhrNV3IkoxtKiD0trE3heWVG
         gXfJ93YdzLFiHXmLptcFXOsscoEKkgz5LtCMg/RfqSsQEtEtxWJVM8xVlTfC0FFjhE2i
         FXu3FWTOv2zrVonIQqQRNteS8vamCDCUk9ZPHqnT3hTEJ7zQls9/TSIoAJVxtMCT45ti
         9UczeCCnpLJX6obBSoFTDF56AoIsuaMgTFLklDqZPCluSUZc48S9Jv3/7HDrnVy27Dq9
         kg6w==
X-Gm-Message-State: AFq9FYIrqIuYt8HqjMowLsKpixPChUppWSIjCEqkCdAGzYBzM3Qh5npG
	s4cJc6hAZac04o/DCQGRit6Y7o0WHH+t+ChqDa4NoXJYAPR40MoDNfm3iz5OlKKnhPnQY6ZYbiZ
	fu6+aKXO0UbkFXlleb9gaLPRdHVBoGCMQfJghOt2KkVDITY7W2qqsRyp/0Xz7O3Uz
X-Gm-Gg: AYBFou0hosut4cC1iMVpNnd7mvqhZp1VmToTWiBNnvcFlZKD2UraOjBRl8N3mLx9Jdb
	7AgyVYdSSbIolwWIpJ1YtpPNCEqIQJ+lgGEIpVqrW7JFh9/zPJpOHL+ZMHoJ0NFT4ChUm+kNDwh
	2714i0unEDrBR0XaCxlLIZ6dRNjt6lC/rIAmFcLV5Y/4XGIxzcCl8lAbD4fqSAgMGoGBndo9VIy
	6qTuxC2PtvjzyXUpSIik3FenI44RIzJESnH6pEe9tKoPSskjEQhEBBNbfJtheuPKx9r+xSHsITM
	d610rHaCM4viQ1hIIPTH+JcLRHw1WvDhDdheSuNrQM0EWmij/ou0ZJK3BPMxeKPTPrjRmC4CduN
	Nlzq2QKDhUfb3k4k0EK+5peyIcxw7+r68N/8dBKcWAnQaTvEDVwYBL9doOFN7a4sz1aejoz5Hlj
	LGkS4uAgVMXBdXLo99xQaeMaBJJUbo
X-Received: by 2002:a05:7300:ff42:b0:369:f231:4707 with SMTP id 5a478bee46e88-36a42225abdmr958164eec.5.1793314567889;
        Thu, 29 Oct 2026 15:56:07 -0700 (PDT)
X-Received: by 2002:a05:7300:ff42:b0:369:f231:4707 with SMTP id 5a478bee46e88-36a42225abdmr958121eec.5.1793314567149;
        Thu, 29 Oct 2026 15:56:07 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm1644278eec.8.2026.10.29.15.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:56:05 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20261015084445.3045925-1-praneesh.p@oss.qualcomm.com>
References: <20261015084445.3045925-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix IRQ disable imbalance in
 AHB ext interrupt handler
Message-Id: <179331456572.1083805.8183504418860911959.b4-ty@b4>
Date: Thu, 29 Oct 2026 15:56:05 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae3cf09 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=n7ogJBxv0B39A75zntIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: x9qMrMfeWyZhrQ1LdsN21Xla96zXliz0
X-Proofpoint-GUID: x9qMrMfeWyZhrQ1LdsN21Xla96zXliz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfX1xHlMoq90CET
 oHyz9EECwUTJF7Ny6nxn7KY3/FzAhxmVbyhZe1UQGMFS47Nh293GVR83pFS/Rrn8fq4p9SroAPD
 ajn/wItLgbcP7LdTPUeencAtzm4lyvuEDB7sKYftLDcfmDAI+oPgEQaHWwulGqRGpuhSgghTcW0
 cBaK7xX0XhPii+Gs9ppZUUUQUDr6iTB/yCdbFBJ3AP9p83D80NKY4+Fz4Hgco9Ew+EUE2q040i+
 4MsH1ORvNBq8k0+XLif1JdQCX3+jbOPxewj3/bvygMLrfS5jdg3328FzZlF9kIHcIKR6cpQBr0c
 0bCXMpcQWZZfALviPgA6DbuNWFKNaiJ+2qQ2vT/uPR8hjhad0jgqKvyDAWvYvmxSryi5MLc8eEI
 6E+DRQ+bxTdBz79/SLF7MUz+Znwguq/WXMRrK8vT13mHrbgMVX8RRAgjtOcrZJCNY2rBs0Xptcz
 yQbLisFcqrC5dFDMCMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfX4nmJ1F/7v1vz
 8f3MRlvqaiSsFkkVi8i05uRbxjqcldaAY1i1ozBTk2TA7gNaovMeF3LsXL8rUVKf8wqhNR+5rtr
 ZLDlsHAk4YIJUrrDedWmcOIgi3XgfHY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_155610_275328_7487367E 
X-CRM114-Status: GOOD (  10.34  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 15 Oct 2026 14:14:45 +0530, P Praneesh wrote:
> On AHB platforms such as IPQ5332, IRQ group 3 maps multiple hardware
> rings to a single NAPI instance. Each ring is assigned its own IRQ
> line, but all IRQs in the group share one napi struct and one poll
> function.
> 
> When two IRQs from the same group fire simultaneously on different
> CPUs, both handlers call ath12k_ahb_ext_grp_disable(), which invokes
> disable_irq_nosync() for every IRQ in the group. This increments the
> interrupt controller's disable reference count for each IRQ twice. The
> single NAPI poll that runs calls ath12k_ahb_ext_grp_enable() once,
> decrementing each count from 2 to 1. Because the count never reaches 0,
> all IRQs in the group remain permanently masked by the interrupt
> controller.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix IRQ disable imbalance in AHB ext interrupt handler
      commit: 216dd4fc57435726506e250ba2483f31ddc3c01b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


