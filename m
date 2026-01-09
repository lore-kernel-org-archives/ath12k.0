Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94526D26D60
	for <ath12k@archiver.kernel.org>; Fri,  9 Jan 2026 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBObDvpD7xoguADs/F05XvaSpMVqqpb7Vf8EU4wwwCk=; b=Gh3sz0oqVPVh+sUzTPR1eULemO
	e7F7TWQtxDvx42Ctxg8Hr6kmAqmnoqjO+RNzBcrLaXnCMpXL2ZYP4Dj9R98ChiLt2LgF+q1LiwRHz
	al1gEqfpBLbABGffm2E8VmBVnYYjuUqIyllP9jKgulvBTkOV6ld6UIcYBHnKTK0xeMdziNLbkyf+c
	9GcQcqzvpcjRGmswE6LCGg33roFHEi3u4suZHraOnp111MpBipI+7n8EzU8lannDi82JrD2ktsm/d
	QIAlnLAIVQ7dXWXzU0K5VLsYSFtRnpd3zAjfNdzn/PXjEW5tv1JI3wmiN01DAze5bf97tt9dweiwh
	LZNM8teA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEg2-00000002WXO-18IM;
	Fri, 09 Jan 2026 15:45:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEfz-00000002WWP-12b1
	for ath12k@lists.infradead.org;
	Fri, 09 Jan 2026 15:45:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098VFXn3728380
	for <ath12k@lists.infradead.org>; Fri, 9 Jan 2026 15:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBObDvpD7xoguADs/F05XvaSpMVqqpb7Vf8EU4wwwCk=; b=H7N1DP6n7tNuWRLw
	yXDvqe/PSH8t+0Yu+zZD+yhamRa7JeIK9if9qg7fHHp3CGaFITkQvk4sx2VC2hrE
	rKeRIVAi0+kWMKOIBxlKxLKIJn2IRv/ZXs355yn+72J/xePTeJeyIoUzYZT6UCIT
	QGPWw/tQpJBVxgYWiMGNRqY3lB5wLBzc1U+2iXJBOeH2VFPQI+TypXB8YxgSZsuM
	khgcveHFv5SVEt3BZLCy496iFERulLC4HZOoY1kHTQBpb16tO+4di+Zwzhp2e034
	uh01/kcq+BY+FPh1TNKL7XGEiiIdDgIgsk+aUVl7gvXrXidf3TIOezyWpy+/ElIX
	8X3kwg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkjk8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Jan 2026 15:45:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b0751d8de7so5596212eec.1
        for <ath12k@lists.infradead.org>; Fri, 09 Jan 2026 07:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767973522; x=1768578322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBObDvpD7xoguADs/F05XvaSpMVqqpb7Vf8EU4wwwCk=;
        b=XQ4bVxT25Yi7QaRP1ddGud3ujIpiXpc6mzRhJ9JPqZFW6nZzLA2hnv3iMd+mK+lDR6
         bsM4kJ5yNIPlqy0FkCZbQ2XKAHFGg9KXK3JI1KKeVCFf/BCvqQ2MCjCixMiEieRnYeS+
         LXqxxHqpk6Diypdn7cdAdrB/5byPDt8UVBdycPZCGI2U0h86QipLcXiDCdObswT9gcPm
         MMIwMM5rVepucUMPdMrM39NtczWhuDoOvboMSQWBJbRdZ66C/nt8PCHZZ48eBxOkfcvt
         7ZpKHwdY6B7Q75ZBLFRKKfxKIfek+ny2ZRmkSWRHjTmdR0xUJXgCjsAFDn1/q4hn+UvA
         PAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973522; x=1768578322;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pBObDvpD7xoguADs/F05XvaSpMVqqpb7Vf8EU4wwwCk=;
        b=nRCNIk+cWKf+uLDsDpQq2vrTzWFv1bwUL3V9L/zc4xCSKSMceMHFMCSw2c22HYmNiv
         wLDGhkmIGwjtnrfDzunx1GlU4qlvYHdv+1YIeIYWgjXvevUo78vWtfBHb6BDEAdCgNH+
         EG4WgzXPeIKMSuMWYwkhcyQAbpkJGb/sP8X0mtGwFo90dQl0Ltqg2hCR1eCwfov3Yojj
         TBj7wiNfTO6ZNhoJT3yamo+8M/Uhfs/GcUAdj1BMo+Dt7Y2Tvs8YK9iQ/8BNyvs0rCwR
         wAGRmJ8L250s7HWIXlnwOydbiL5umZdTovw1lgOo1g8LOLfh6wgbcbzh2rKCz43jpYjW
         GqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf3eko4BCR2q/+XrX6ylS6M9eH6Kjkfy8q/yVtXpajmBejsj59MeFJu4bfT3z7b4taWVnHh1g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0/JdJ/M1Kw6ZKaSOHxtvxqVaLmgL4mS4rZeFMLYPQFgkeG/lT
	7DZ/bDfJqSRunt7HSFPlB8dkfspk8ZR/4P9A8CnNex1SXKu0hd5fth6b0F8YQLJJIhFntIhKsRk
	9D+DxFttSUh4cToFaaVYCGfENvnuK65F6UhLz1/EUx47yvjGDdWq9z0r0vcNgtqhL
X-Gm-Gg: AY/fxX6JVhgvOMSBfSPfhISVPdOWDJrR/+WYrC9ZnjcP6ZpE/QrS9SZkUNpFRl6Lxs4
	2iVOTBpL9jBb15DmZ+/G7IwVaiIUud3qshmR6AtkxDkopXgBRionEgw8GxnclRavW5VNSPYaU9M
	viEXQkZ2h3BDI14yKh0F7Vy8D9YFNC14hmyl3C+x/b8rix23JaGMlFogAceO3OJxLeC8db2PBJ7
	eObfnHdnaexbP/oxzzHnnZFIY0nallBP2evF1fzLoLsIK1QBEDbbQ40MWFvzKd+U/KlZIuO8c+Q
	E10wi1ufIcMSlGss6JG/O/5oZH57LwPnOTW3Grz39Wdtdw1wNXPos7X+LQSG9X0L7agH95T4pAJ
	nUggqtvREfS6M7H+8ADishdEKTcGjlpekZRf361qpfW3WVQ4y5k7gC0IfkOB1DMRl
X-Received: by 2002:a05:7022:390:b0:119:fb9c:4ebb with SMTP id a92af1059eb24-121f8b79686mr8559670c88.30.1767973522050;
        Fri, 09 Jan 2026 07:45:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQAw56QFLH6GdhAipAkIvcalyVNFn4UvlGVNoGh83Ec8aR9jGRk1QOBEr/C6Ot7iHgaYm1+A==
X-Received: by 2002:a05:7022:390:b0:119:fb9c:4ebb with SMTP id a92af1059eb24-121f8b79686mr8559640c88.30.1767973521476;
        Fri, 09 Jan 2026 07:45:21 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd8fsm13212585eec.20.2026.01.09.07.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:45:21 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260108-ath12k-fix-freq-to-idx-v1-1-b2458cf7aa0d@oss.qualcomm.com>
References: <20260108-ath12k-fix-freq-to-idx-v1-1-b2458cf7aa0d@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: don't force radio frequency
 check in freq_to_idx()
Message-Id: <176797352103.2503774.15868075512188538185.b4-ty@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 07:45:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=69612292 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=m1Fd6hlChVUmc2GNY24A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: uBhkl6tTEq6J8CjTb5hQe3iBGp51JTC6
X-Proofpoint-ORIG-GUID: uBhkl6tTEq6J8CjTb5hQe3iBGp51JTC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExOCBTYWx0ZWRfX3PYBjC6CQz/a
 JsPLGa0bY/daQ82rKA9+m/lAWEYszTvVgj0dXE+wsSaglLPJHOV9SO/+WM86XnfUIZLISwQRf8v
 OHiC/QWY8CUKspG7ZQApjcuu8uq/hffs4WKBJPl7F8Kwb/eRA/UK47tg3OFGUZOzmjdCsthyIvY
 Tzn6P/rclddnZPBQGdBY5WeTbamyekg1FMKg80svqyA7dfN1DRQCfvd2tZMK0AJXtXnDzubNCDD
 3kUPugn5yCrNJvNQAEQZGwR3kqOnRzXyOmDNDz39uffrPDIqbuPw1zPxT0MKFMq08Wz9wjpSuMi
 +gKY5gHjFQK3fKQ935lnblCA5oJHxHXToJPgV3BSM4EecoD5Tb0Z88rESIWP6+VzbRFOd+woEpE
 8P+/2KtUpwo02z10oYClY85zVrwrUIEDoNrpl8MU4OEK1l5GIFMFEUsMIEUlRNtxhwBhudSZMZe
 5U5I2FQZdv+DTcttYxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_074523_295173_FC14A240 
X-CRM114-Status: UNSURE (   8.62  )
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


On Thu, 08 Jan 2026 11:21:46 +0800, Baochen Qiang wrote:
> freq_to_idx() is used to map a channel to a survey index. Commit
> acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in
> single-wiphy") adds radio specific frequency range check in this helper to
> make sure an invalid index is returned if the channel falls outside that
> range. However, this check introduces a race, resulting in below warnings
> as reported in [1].
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: don't force radio frequency check in freq_to_idx()
      commit: 1fed08c5519d2f929457f354d3c06c6a8c33829c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


