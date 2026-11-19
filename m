Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF24E606A320
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZBjW0jES;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ot0PBs8d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWgk0AMA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fS6ouRdFNUyQ3CoF5DKQbGaHoJ9ULskT8tAldUoBdhQ=; b=ZBjW0jESr5vG3Up1AzF7dq+Az+
	xg6Bfz0AMFn7s9x5XjqXTk1V5UzHfi0iWMNhrdTh56ccW2Gd50LggRPBSmHEfnEtc0VS3pEzmfg0x
	wOMY2D5T0ZPwiN8eTxESSlzwsc+S3qUycSHJhJ40ZJK7x6zs0fMgg7s/lfq386K4uGg/vSo+bHwiF
	49Qk7NGFxmH22g3CDaSh8H6ac7UnzOgrtHjqN7/xvtiU3eQZjjN/wj/1P25YsS2Y4VVSFp2FKYk/s
	qeE9bx5T4QTPF1VHwI5gLjRWGsWYTY+Hx7RCXkXAtv1/mv7cvcBEwK13KsvSzJ0NUe7Poo9VLs7WY
	KqfscBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzpt-0000000Bcc7-3xzl;
	Thu, 19 Nov 2026 10:57:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzpk-0000000BcZ5-2xrf
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 10:57:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAufhq869583
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 10:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fS6ouRdFNUyQ3CoF5DKQbG
	aHoJ9ULskT8tAldUoBdhQ=; b=ot0PBs8dNGmZ17G+B0KeeMLL6pvLNgN3Qi33p6
	CcgQdZZpK86UGcN9gFn6O80lcq/dVnnjSXQbJUgG5dfnd5Wrtow9pgWnuTRxyDx5
	bDTRDT2qMeWJ8yhDBx7tfTlfjbZzs4qkH7q+m8rwB3rycM0RjddKq1K5oS2U3bMI
	EwDgcNLhw4+Ol5UbN4diGTtHQpncdZixt/Prw7o51mUhwsyktPw5r3s9kqdaVMW1
	sqSQ9epwjRknmzOtyxCYAAHoW5CR/2agdaQL3XlorQW12vE2qLpuBNtMh8FvHNnb
	CM1zs2LaFm0bj5BEu/L00cq1Cw66EEXxc9t7ZgAZtkRuROug==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnm5r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 10:57:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso2420819b3a.2
        for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 02:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795085858; x=1795690658; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fS6ouRdFNUyQ3CoF5DKQbGaHoJ9ULskT8tAldUoBdhQ=;
        b=iWgk0AMATMKhSO4ud74m65VJzVoTkEcU/yceLF9I5dQRbtOJVjOAE1AALeQn1QY5kF
         sKO5tyUUYcd00da9syKr8k8OKKvBDSctraYRWhpbPzUdUrwuFeoPDjAlFCU2guiRjqKT
         T01genWGtg7m36D+Y805ynjd81yQHLlRNQT5e3OZD0quOK7Ma1GPuemXwcA2TaJo5w6a
         ANPx4tDBHqEEs1oWmDsuz2ApcxU2z64/T8VhbBNUsY+ZWtnYu5RoPbgujoEFivfT3gWs
         VmbFZ70idjIGA/CthSrXVHfc4Y0wbbsgHRnl3Atp8+0G+KSc6GwgJmZEzwZD5bzmEeWr
         tusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085858; x=1795690658;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fS6ouRdFNUyQ3CoF5DKQbGaHoJ9ULskT8tAldUoBdhQ=;
        b=yw5FL4n1w9TcNd2J81Khztu1NbIVIOa8p+nix0rdeUu5JnxRS3aBkiyCHXY/haI485
         vHhtte/3GITweqoHt/igojokcai+XHEIv/6fzkCbTeCPiGfuDCclujsb1IrpVABW7NA5
         ZGh2y3b0fWYx4QUpFjT7oEu2g5mnfhio3Olda6sfqjtVwCkeopHTA5L3lxUPgX5Ny3XX
         nvC440kfXtGE92MKUaing82SMSWh0UjBefkWykrcRgCzLPx4b3vCtCdoYFcM6oNBvOec
         f3CFdk86J9FjsM7DzgbuX7ZaNdjKcXznnYAjfqCc83BZYgWX5Kvrb531OLJ+m7+Tq9B3
         CmlA==
X-Gm-Message-State: APuU4Z9iPDpBd+u/BVE1ZxOZ0VBQV80SZI0pM0d6k0kG9oGUlUYWOhoo
	bBWcQDaWcsexqFYL8Zhin4nKcsie95EjPxFWHcL4nBxdgTt63n4bWQW1708LnLYYl0Z7kOS/Zsg
	4PjCk6r0Kan2HhWfyRygk7V07jrLkAwDjFqtjLa6vPoTIttlD1vjqTMl4AdeZDaU6IcThlhwK
X-Gm-Gg: AYBFou0HnM+P6V94a4kywhpT6ogeeX3kmK7Tz9hVxlGj+YieMH0c1RbVNh9lVR+xehB
	PwW1s76rX47dZEIEIOAnnqaXd5ZjbZERIEsFXBRyGJo7Cxoi4QAmzleYXzwRlL/3JTRV6KqxUN5
	ygBj2JPDiSjEhq3/Yy5PAHFz+k8KxG4HbiuEraJUzwEZ2RVLgI2xfqi3RQ9HDJFdeDH83chTQz3
	l+oW6CED8Elscynkbk3D7iMf6rOih503s85TP2VUnZcwdEzBxbKZeJorrMtyVoiMege4BlLuelC
	Q7ylGGhJirUCyld4DmwP7j5x3FEH+8bOZQ9OvEogoNfpu+KnkaFuPeCjGmitDqmPlMtUQsIFMtG
	jlyvu4z90/ykKQNdXCiZkuT2oAaCPcZn6sT9FeZlusBGjZJ9fcsgTGb61PE87q2r0+0kPPL11Q+
	4ZfB3Y
X-Received: by 2002:a05:6a00:908b:b0:89f:9da8:1b66 with SMTP id d2e1a72fcca58-8c5d3e0e288mr4754438b3a.33.1795085858457;
        Thu, 19 Nov 2026 02:57:38 -0800 (PST)
X-Received: by 2002:a05:6a00:908b:b0:89f:9da8:1b66 with SMTP id d2e1a72fcca58-8c5d3e0e288mr4754426b3a.33.1795085858007;
        Thu, 19 Nov 2026 02:57:38 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa27dsm2624514b3a.19.2026.11.19.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:57:37 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:27:26 +0530
Subject: [PATCH] .mailmap: add entries for Nihal Kumar Gupta
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-mail-v1-1-ff43ca04517f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABXW/moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NL3dzEzBxdYxPLVBPDRHNzA8MkJaDSgqLUtMwKsDHRsbW1ALCp4u9
 WAAAA
X-Change-ID: 20261119-mail-349e41a7701b
To: ath12k@lists.infradead.org
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795085856; l=1048;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=9M5iE0s6Uq1cN9xOCZ3NRWqwwm98ho7zvXIhCxKhF/U=;
 b=nWJPJ/uTKwzVwpN8ilO3aGffYLwhIwtLbd8T3qTxLeOQZjnUqoEC3W6xTImxJoC0BgMZKhD7S
 J3y2aNlBItQALRM/4u8H2WRKO+4RlUiGfee9ERo+P9kiQs1j665M1MC
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: _cyRWs9-VBCKy8JtDBxKhz5cwxfJulkv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MyBTYWx0ZWRfX4h/oIBplNPfh
 DzYFgFEJzoIeVuLpSHgVIuvorZUDRdtzCfPlXpglOLaQJ1yuQamSLe654kkqtlAnJ4iYYuFguQx
 yyJd/8EHlYHzUxCoduC/SRz4UHz93e6eVn8cnP9vNjM06t0qZ49jhVtp+w/gAjIQn2paZhNXnyM
 ATnucsf7HE3MFaW9mqHQ/mpkWKA5sbn7HOHqpHYGnojFbR94f2RR/xC9xzbnUgPBNr6xqAkQ1dr
 dO/Dv/AyQFi/pm7keGSAOnrw1EJZLgdoe8AZCseeNaGbyjU4LKoqyKLn6jezvV1HK/szdZGPIs6
 QSeiGUPpaeBUHm+g3A0cNlOj076tWq1fi+DKl+NGTYHUI1r84T9tvvVu1r1/bcY+0XvRUB5MKIf
 51xWbaTCBsyk+x/LZPWHswDt3Q4tqfl2yice9lO2QMayC8uIS1i9mMvqyh6SXcFV2B0/JmfYjRy
 SkE8DXp93+LdtwiK8qQ==
X-Proofpoint-ORIG-GUID: _cyRWs9-VBCKy8JtDBxKhz5cwxfJulkv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MyBTYWx0ZWRfX4UCUGaSyTBv5
 b/xGKItQeNeZHGmE1O6t1e+3gP3IHN4WlleuvM6cfRZdjmJDyxhVOPvNtgxlXCUNHJWNvh4jgj0
 /noJfDSPoUPck7WcJq7NWCFBeywmiHU=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afed623 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=cpyHj8QvAAAA:8
 a=COk6AnOGAAAA:8 a=vr0dFHqqAAAA:8 a=20KFwNOVAAAA:8 a=e7NQXPWHO4rgaZ3vaDcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=BPjOrAZP5zzvMhA9psHf:22 a=TjNXssC_j7lpFel5tvFf:22
 a=P4ufCv4SAa-DfooDzxyN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_025740_810878_4BA6D0B0 
X-CRM114-Status: UNSURE (   8.88  )
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

Map my previous e-mail address to the current one.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 67ee296143172214d95b846857f8410577e42908..8e037a57663b1352c9ecb2e9bb106867218f0804 100644
--- a/.mailmap
+++ b/.mailmap
@@ -732,6 +732,7 @@ Nicolas Saenz Julienne <nsaenz@kernel.org> <nsaenzjulienne@suse.de>
 Nicolas Saenz Julienne <nsaenz@kernel.org> <nsaenzjulienne@suse.com>
 Nicolas Schier <nsc@kernel.org> <n.schier@avm.de>
 Nicolas Schier <nsc@kernel.org> <nicolas@fjasle.eu>
+Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> <quic_nihalkum@quicinc.com>
 Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
 Nikolay Aleksandrov <razor@blackwall.org> <naleksan@redhat.com>
 Nikolay Aleksandrov <razor@blackwall.org> <nikolay@redhat.com>

---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261119-mail-349e41a7701b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


