Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1633606A32C
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rbpH3Ruw;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khkVGFZD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CPath0Cr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=F5jwxRqYXp6UAdJvL1+06oMIWwImxlk81sB8Mvdm4gI=; b=rbpH3RuwjFJCRqjSamNM3wDB2K
	Ua00nple9GLwQNsD38ptyIeA2xBWQ096K2ftpnaRN9pzzMuFEG1b5Mxa+z6YfJN2bk1HFbH2d2Mi/
	3BO+h+XF4HTvtsNTdKS50DQClENHN9PCYNeeuCH1aC7/omR1fPKlLsSlxVe7JxMHHH9gwTPrWSlGs
	cxa6RGtzeyXY2SfbJ2C3Vpz+XWTLAcEWJ9IKuB6JfUAsjRkR+IojZj2VG2tZJar6lpI5vbamEqA9x
	aT6GiLSiV969lQvtB1HUEhQkMTuRBleBaeKQhzZkVqPC2oYnahfhCEGjkKyAWf94dxsCfFHzyvvEO
	140W6wEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMOg-00000002I9T-2c6e;
	Mon, 23 Nov 2026 05:15:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMOb-00000002I97-0kIe
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 05:15:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50rHO1264151
	for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 05:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F5jwxRqYXp6UAdJvL1+06oMIWwImxlk81sB
	8Mvdm4gI=; b=khkVGFZDcdI1HfOasRPsobzDsEOtSR7ZkOvowbOme5Ojf1phVei
	tpy4reJ1tGKR3010qZ7v21IZ6cCaIGLegqEVp/PwPZoGO0sPXIxmaR2+8bwr6wXs
	HlBJmeA9N3bmitNC7hIAZL/JX2k3qa8Php7p7czrigziD4uqzblyrR6P7lFciq3Y
	wh9HnYrWuLGUgX7W0ptPjYa6o2PDOhU+k8JmaJst5dVcZzV/4fXLhT0jRE/T4D5m
	0CuDMivatsBgp+N9IUGS8Mn9feHwQxon0nd1jQG+UfPYrMCOykVP9kciLZehNh4r
	HbtyUzuCzqbzt6ENV5QIMRauzqw+6XmCLEw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h357xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 05:15:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1628544a12.3
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 21:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795410916; x=1796015716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5jwxRqYXp6UAdJvL1+06oMIWwImxlk81sB8Mvdm4gI=;
        b=CPath0CrTxEvhWtUfgJuBntYMgeboOnGzkYszpYgTy+spFLLD5QQH//FzpE+n3hCC7
         U53hZEYibIKrjlNc2PwgHZeh+RXYXp3aQSHzSAcUWFkuFgGaUT4KzDnJyxcXVUSgQItl
         mDH7vVOqYTAGXOWr+MEEBnLCBMVfCm4mErMyvepjl7iIqq/02hnnHYtaZVPjlyaaBqjs
         mM+Ma9omYe3gbpMz8eo75DeI3fZ8V9/0ES9JkwGcRfs/6ySvqUxYMD1e0OtJbKjsEUKD
         Rgm79hw1uXWYL8WbTgFEVTgRqX3sz1ukURIAY0ZiJgFODarwZ535S7S6YQfd8k9g4miP
         zAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410916; x=1796015716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5jwxRqYXp6UAdJvL1+06oMIWwImxlk81sB8Mvdm4gI=;
        b=R1v4XcPbBDPGKHUR0VEP1BN3pTZmI7owZeB5+/6npwLtKWDTlB3dNobSvEA8NnIsX4
         Co+DjIe75p0aHGvrwjeinKvhz1KfAXqhfcmCdwWJ9CHRspTY62/6AqAN/aAUYKwcddQE
         vmLBq36yKzQjU3nMIzxowjv3m4fhjMEfU/QsSxhGdzbyhgb/udZ6N0GJ5Y4so/cmYY6a
         whPtowqDJEAtLlBnqNoc7sU/z4jDokdduRsPj2TQiIA6WGz72ZAbXR3d5FUd2dfYLWb/
         fksIzahuvmLPkO6+3nroN4lHpgvy3MAsfO7FpEkoULLFwqDRW86xja9UC2g5+kpRygth
         w0Wg==
X-Gm-Message-State: APuU4Z/le6t+l8YIZgB31hsJbln1W2grlnDZf40qJJ8QCOQlSgtBu7zp
	ezB7vlJ6Val6+u1vhVU7J2mcRlw+Fiy2+T3lnHW+K5P7iV8Nf+g6f1V2T6CWFZa3CaMYf9MN3N5
	fCbC61c1mTXLwjGZDrx7in8mmIloIuoc22E132dTnycreOle4ECUakoTBINp3wPmvuVWA0Amx
X-Gm-Gg: AZFdTZdeXcMVoMKsxHnnQvNFFSmwofpOPjxKjlgxkthwl1EWrDHzIjxyvrfJivsg3kD
	5WJ/+OdSDw0RkSLdaMoiAGbmlBHaLSzwuj9YZiGq0K24+zRbhbjwTtChW8EYTGGZSuOCe1NJ9lr
	b/BMAc4o1ve+Pyx5XDHPaqUnvozY5VE+izaMhBE7wUQo2pH9Gm4LNXnFOj8eRJzWwPE4VV5opyD
	hfS5m+UUSwcnvTjOncXHVtVcy13cnZTyfh9+gHCOa+nckZFy8o2CEA/yFK50jR+52QagRVR+lpX
	bwdL96GJDQNYdNaRkRiviaNlTKX4+MF3GoZdCTafqSOsvvjWpXVzsWnsGADnAX7ZeA86qbvqA51
	1VnuCj/nyWqHdVaKUJVwheFl628S+6xXs6R0VUF60oQeSfyx8Fuioj4aP8+JKViagdb0BFy8OuZ
	BLVaCKew==
X-Received: by 2002:a17:903:b0e:b0:2e8:e17d:c8c3 with SMTP id d9443c01a7336-2f03f1da4e5mr98369345ad.62.1795410915564;
        Sun, 22 Nov 2026 21:15:15 -0800 (PST)
X-Received: by 2002:a17:903:b0e:b0:2e8:e17d:c8c3 with SMTP id d9443c01a7336-2f03f1da4e5mr98369195ad.62.1795410915058;
        Sun, 22 Nov 2026 21:15:15 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0f8sm45585105ad.27.2026.11.22.21.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:15:14 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: jeff.johnson@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH] mailmap: add entry for Faisal Hassan
Date: Mon, 23 Nov 2026 10:45:02 +0530
Message-Id: <20261123051502.1292590-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b03cbe4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8
 a=5RMfLv2CAAAA:8 a=Uv9JCAGEAAAA:8 a=t-sKAlzEAAAA:8 a=QyXUC8HyAAAA:8
 a=R0U70VHGBz4yji4TwkkA:9 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=odzF4sUljfPCBiNS3l0_:22 a=4C9FZRVQUg2gnIcrderS:22 a=HcdbPY3G3p4AjVSNgVh-:22
X-Proofpoint-ORIG-GUID: 8u9XJ20zSbgz5lwILlE3nsi8b4gvUWFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX8LK7RSNYQ5jN
 Z5NtDsMYxKyl09K2g7J/FzwHBfJXor4lJmywuIHzNPKptLtuc9kOvMEDCvKfxdEP4vlHGSAZ6CJ
 zTZwVp6/P2QYcXQCRu/FfO29TjvVx2YxnaTbjjdRAQJZn7R8mDzsJh4/VZfEo5pQLYhoVzrlSrO
 pPu705uSgNr0ZHKycBHK9V5yixIuikNYOByyBwPbj4JBA5ACtLNZxmd69ZsGvtGAye1uo9h31xC
 fScFYeDl3S3G7iRA1EDg+2SxwUob9DVMiJmJwB5RDUs9CBDSCEqLpflHvbw8Y0bFtZkGOJv0t2y
 4QuzRgy8smpi714a1yGcDMhb+aXp23abhxt9Vbi8dXFrxzU/12Ngr+UvZ7Q+qN4zizoZSdGuys+
 HCfGRSoBHvNT5auYKpIz1O0kNQk73380Iw7nQc4AoREuiurH6Q2xJmpmUUo6qboUTHm3AuXHdAD
 kEgd4s/rDZZMdj6OQfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX02sAtSrs/LW7
 FTFH7Pbbk8w2V1AWL5NsjU3S8i734X+rOtcYBjxmCghIEDMOtIo7I6cC/34EVIn6k+wL55JzXTt
 BRo0h8UHfWoG8ZrC3L2ytrvMTgioQto=
X-Proofpoint-GUID: 8u9XJ20zSbgz5lwILlE3nsi8b4gvUWFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_211517_221107_B0741BF7 
X-CRM114-Status: UNSURE (   8.73  )
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

Map the historical quic_faisalh@quicinc.com address to the current
faisal.hassan@oss.qualcomm.com address, since access to quic_*@quicinc.com
mailboxes has been removed.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 0a0be49bc4de..d33e4de92d9c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -296,6 +296,7 @@ Eugen Hristev <ehristev@kernel.org> <eugen.hristev@linaro.org>
 Eugen Hristev <ehristev@kernel.org> <eugen.hristev@collabora.com>
 Evgeniy Polyakov <johnpol@2ka.mipt.ru>
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> <ezequiel@collabora.com>
+Faisal Hassan <faisal.hassan@oss.qualcomm.com> <quic_faisalh@quicinc.com>
 Faith Ekstrand <faith.ekstrand@collabora.com> <jason@jlekstrand.net>
 Faith Ekstrand <faith.ekstrand@collabora.com> <jason.ekstrand@intel.com>
 Faith Ekstrand <faith.ekstrand@collabora.com> <jason.ekstrand@collabora.com>
-- 
2.34.1


