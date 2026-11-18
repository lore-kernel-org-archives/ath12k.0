Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25B6606A339
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2v//pOVO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=e0IMTjNm;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pYXxjui0;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ULrs6xj8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AEPNCtr4I8+ysKGxoPzezGkgjmXzqPdEY58TTIxQCd8=; b=2v//pOVOqqUksysDI8zTcfAys2
	KVd5EZpoPodMnQJI/nosHOPdyKoqPYj5FhKmzYyE3oT507CVMDqYlBsFRsHd2yWSPVPbH/npgMDYf
	OHCyjytZ/nsdKH4Wb0EU2n9LlFzzcrfqQHx1OEtdGecVOHIrZE0efimZBVtUO7xOJg7y5Q8P3wClJ
	C8rvhVi6jkbjamDaLDb5yb3Phy5KjWMc52JbylMgqe47DQ7QDQHxRy+BOBO+KcZuCGtvieTbqUktb
	snOQ/JDj1tFUGHmQlPNB80it6dfsIltcgBbrURFXp6PR2zDFZckvLC0KP/BYc/d32IaVbl7OC8Zve
	P7fK+egA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqI-000000088cm-2CgU;
	Wed, 18 Nov 2026 08:16:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqF-000000088WA-26PS
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 08:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=AEPNCtr4I8+ysKGxoPzezGkgjmXzqPdEY58TTIxQCd8=; b=e0IMTjNm64JtZ6dQpQ19m+K+RQ
	4Aa+vq65VzuDesq0oCs2qaMk5R1+6aKxQIpoEwJHCdMywIhzX3SvPwfTJd42Fb7ceg/miv0bsG7X0
	pVxuMkurcZ6Ff+HUmWhSOQ+XSqjJkV7JfiCWGrIbRsnpbXCgEKq04HUgCN5u9YhdnweTQKlccqxvF
	oFXiCeiY1pkTYEy6KPsxXhng9/MK8wCl2Djvm8OONohxQnDYFn1LRTy1E+8b5zmLlGpvYm77UVPAd
	jGMbSZNlqwBnnrpXEXInvWmSIfbDOW/ksW7wEXvoCM9WTP4LVzJboDEWZh0NivOqsWj6zn98Pe51G
	X9xNP+VA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaq9-0000000BIlM-2nBJ
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:16:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI7UjH22648324
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AEPNCtr4I8+ysKGxoPzezG
	kgjmXzqPdEY58TTIxQCd8=; b=pYXxjui0mwbaG4I2REUnf4WqHGgx/gI+TNvhux
	Kj7ef+YVIicSjc7ZmRtki7oKgvK7oZhg9ZagUvGYtgBlQVGoO2RWH8VmrEgak9LU
	d/Ffm8mWI1c5vIz/6gJFSSUdYjpYyFcVa5jj8DD7CLci65Kcui1OfeMkdgAgGINm
	NDUsIncud8qBEq0ZowLzr03jIq8c7JcFH6uDtXIO2eVLf9lc8ZdrFEmT0MNssIA1
	e7jR2/5xh3Gvq+yfXHbHMGxUSkjCTD83e9yCMdA24hR8XcfIArYq7c74pNrqv390
	Noia/ZS+Y+M7R2RE04cJ+rMvjEm+lhWwpD6N2rRW04OiM09A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8j0ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06750c74fso698696b3a.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989781; x=1795594581; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AEPNCtr4I8+ysKGxoPzezGkgjmXzqPdEY58TTIxQCd8=;
        b=ULrs6xj84rOJnCeQs0FciyTmQxoo4rJnmvaM4pNcoH+mzVRmQAbhTjQmxQ0kqlXPjS
         5l+qK20Rme1zEkkzC+A+2vDFCp219P51qZPXUvfT9HIhnJDGMsChW6w+BG1i6opOliSM
         RxUcaQwrpQ1Qxa5HzbWWfDOXh+WSgarnTEerlougUoYqkF0t7U6sbRT3cmy57JhJI2gl
         a2lU4B5PHDeSQszFlC6A3vTapYBnDpTc+DbofrZ6ZCUqcTwFvnIs4Lnjn3EZSqs2d9Og
         z7BhNSJ02eZkF/qIf9UESc6FZFVlTj4x40rRW+bEbMlfKozCNgYBYZUy3FXi4Qw20lUn
         wqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989781; x=1795594581;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AEPNCtr4I8+ysKGxoPzezGkgjmXzqPdEY58TTIxQCd8=;
        b=sepG/YSPtpwf4wp1wECDq1xFzZRphCY5bxdY+wfHgQDpCB2RJopnFCTxrE7z6zmWDn
         tYoKmw2KM/Eot2fE1B+OApPpwGdm/WdBfeKkHzwpkjsnoqJ7v7lfpifaXZWzGbvQPi3o
         FhUac0r0yWfUKImon87WdkqT6YyfApJnniy5RyNrZFFlMdQQf5KCQi5fG3RqpaUNni40
         iEnRX2/yk7dpSHdc1+YSdScModSPPKSmT4V5y0QUQb9wYIHfhVPVcWmOLsIn64yCTsQo
         saxzizTzJ9HhxoNiuSk9z6b7osw8+rkKhh1gdikc8kbbQrz6umyiILJOCChqcJKQBBN/
         Ir+Q==
X-Gm-Message-State: APuU4Z9QDGIiyv/oGhMeb3ikTVsHxDl/qgboYIwI8Y4yXfGw8JNm/UKV
	a6lLvSEg2eWXmahNDIORoOWUeuQaqVigeT6m2YjRqcPW6e7N0GXqo1QkUNmy17v0MaQm0YbgNJd
	dyda5J93TNxUCOiF2WKp7/lxLcazpNCK7EeNZJ4YzYWDaDru701W7BhQzSBPHzLddVY4WM+mm6R
	A=
X-Gm-Gg: AYBFou3hZ9lrWnNITitIdYflbLFJyyO1/dEB0SKjdx0JSiXDmkIGADR2/U/m9GeF60S
	lxZF3G+GqDTf1e34s6cWwrPq2Wow87nqY7H/XwpHTcAenAfm05ihAlrSgidgq/d8aCK+prR38eJ
	rxHqLbW0BGvMUMm7OMRHFiI1GiPHemeSv4V9D/nP0REOvhU2fRNmhi2cpKWjzkBE7RUSt7WN2Ea
	Yzn4LW8HNp9Q9tQCnchDJdrgFzgdmWDwKcQF3af1E/5KyMZn9OgL8ucT8kOfRcXGkFfC3n1fSM3
	2Cv5hHWQWKcBntG8dFBbughyQtejftZwvV5uWpcuxee8tu3XpV/UabK8H3cOhH6KN5OJZUbpKDl
	2/ngGwzJMvlJlkjxmv6f7rR6y2dszGZA2DZExln3qxPP1umwgmm7PRtUzZw37OSmdTzrLXHnRoZ
	05LP3oT/TTIfA7l7Q9nrdcJFBPn1m2WZkAMs1K
X-Received: by 2002:a05:6a00:464e:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c5d036d458mr1498965b3a.1.1794989781354;
        Wed, 18 Nov 2026 00:16:21 -0800 (PST)
X-Received: by 2002:a05:6a00:464e:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c5d036d458mr1498951b3a.1.1794989780899;
        Wed, 18 Nov 2026 00:16:20 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99f91sm795101b3a.5.2026.11.18.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:16:02 +0800
Subject: [PATCH] .mailmap: add entries for Jie Gan
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-update_mail-v1-1-81cfb6ff9ec1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMFe/WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0ML3dKClMSS1PjcxMwc3bREk+TkVMNEw1QTCyWgjoKi1LTMCrBp0bG
 1tQDVRCTxXQAAAA==
To: ath12k@lists.infradead.org
Cc: Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794989779; l=970;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=oh9CaFPcf9GgrSMwbeEBTGxEVyKsVN/OlbErr0Hc2uU=;
 b=ZavazbAUTym6MbT9796WUjflrju0FHn99CTfmkNfdP5Xm2TMxhDfnLSEnTJJT5DsgZxwd8mrq
 efVJDMMUlaHCn8OuHZSJ8c1qmzcZx4KzrRXFuCp5K0itXgPZwE8JF4b
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: xB8SibGD0N9446wtG_INTG3dPm8UPZ1t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXxZYZRtoWN30n
 TYJ7LNiKceNxatRmPnRVcOz1FDppLVQrGbLAv6cIIDf2HMjuQBAQDA9GUf4EB8BCGpsEEjhk4HL
 /AuT/ysYPFxpt2b862cXsd6Fj10q1xg=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd5ed6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=Dj1Xmdj24srOsAgj-68A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX1sxHkxIpoXbF
 fSxrTW3F/hgTWsPDJoanDJTvzTKiSKeasuIY4Dbi89/7AlElRfcAVVe97vVL37ARYGynZcfNLtL
 hiaJa8OpPPP5odKe56BF46C+yDgOMd1QgbIBQSD6juiPMP1+V+tttSGTS2Plf0bK2leFXb2mxF+
 oxSU58VqJosXd81EdyJmMKk8FipdHd62E3pi6o7lyZiC1k2HVQM0Di9V/Q31Hd8F/ObONq7mk8q
 kkU9vLfFfgqsL6DGdcCHIWRHXT7jrbOE0i119QCNTedEpDMzIeWlJ1fOcc4L8TON+8ZztrteyDN
 qnAu+a27CIGpCkiEFKeKipL52iraZRb1I89lvJ51y4+WPmL165WZ6aJWStCNRTUQPRhafPMP1Xr
 CUdJfsqO6NxFfs48HAFrp5aKLhWY/Avy2iOGooxEaNNkYqlBKdnjio7S77tgh/2Y0JrV1W7CbSv
 UcOBVTi4zg3j/uVpS/Q==
X-Proofpoint-ORIG-GUID: xB8SibGD0N9446wtG_INTG3dPm8UPZ1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081626_043739_1A0E2A6C 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Map past iteration of my e-mail address to the current one.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index de477b76d6cc..9e1b1f10367b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -464,6 +464,7 @@ Jesse Brandeburg <jbrandeb@kernel.org> <jesse.brandeburg@intel.com>
 Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
 Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
 Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
+Jie Gan <jie.gan@oss.qualcomm.com> <quic_jiegan@quicinc.com>
 Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
 Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
 Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-update_mail-fa4cce1a1e48

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


