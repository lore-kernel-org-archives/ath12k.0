Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D847D609C2
	for <ath12k@archiver.kernel.org>; Tue, 16 Dec 2025 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:From:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TEEx8ZOIqVaaJXZbASzMWtZGBEUAD7Bnsz8r5TpuRUs=; b=SX9JSAd/0Ah+tLxUZw0BJ61mHb
	QG2oxMOCE6BMbKqaWiTPS45rZUG/H/zMehYm7lSK57qLppnqd0K1cmr0IvsjOqF2oHP7GH+Q3CLLE
	joBUP2Oy8IUDvwHNUwFne/Lyd4G7t9Mc6Zxc6CqncFk46WmEvbXSqPFt2XKmq5YP0ugngUzt2SLVJ
	X2XVQ+lZrqoC1HUp4UfdU/yMOFzAxamN6q1bLs2MMPKkZc/FmZjrdeSoI+Vt2bp0KmDiUzEeXp7Z9
	knFdFMYnTkwXxExYR7Aeh2sniqJrvo0KtvhEbGsIl0VWu+eLvPc9vm2m9c/Hh/hXxAeKMoAk87Z7W
	+3XgesPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYPJ-00000005Zz6-3MIR;
	Tue, 16 Dec 2025 17:00:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYPG-00000005Zxp-22Ce
	for ath12k@lists.infradead.org;
	Tue, 16 Dec 2025 17:00:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGGZDqP018870
	for <ath12k@lists.infradead.org>; Tue, 16 Dec 2025 17:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TEEx8ZOIqVaaJXZbASzMWt
	ZGBEUAD7Bnsz8r5TpuRUs=; b=VkrTVqqS7I1H+D3/+E7K+XGaz/Z8EbjK51nmjB
	xbCa4hdpCRvwSIJ8PyhaRWgWCj23a47J1MNk5Gop9HFzTPfm0V/AmzoiwaLC0awf
	uSBRdsiOyZK8n2HztWRWAEcfPW8iHG/FyOnrkc7HPphdNJ9yEd7UI/xR6kE4f5g7
	sXddMseeuJf1Bh659nLp8wXhmpzCnQp35djNCXHV1ZxIPWe7fcL1yWSrwUnu0pUy
	Qk1Jroli5oD2Xp0SU+qZjE19UjEEp6K9lDJoOlLadGwqRm/QTU7TbpJPvq5cnv1y
	DST9k5RgfNPAL3D4p9R2Coz2s0WU8mi8JLP0fHh4RDDvRmMQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b366q9b7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 16 Dec 2025 17:00:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11bd7a827fdso6385371c88.1
        for <ath12k@lists.infradead.org>; Tue, 16 Dec 2025 09:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765904411; x=1766509211; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:cc:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEEx8ZOIqVaaJXZbASzMWtZGBEUAD7Bnsz8r5TpuRUs=;
        b=O8w0bhJeXS2YxPO+RG/BhM1iKh7H9LenpjWmzg6DD8HUEbIZ+zXtyuYQfj5pKzkICP
         JpGFEf63lAo63cLHmSXgMn2PYGSxwDFdsrJqvJIg0PDRcOo2WZ3FxYf7pV6IBDJ5c+9q
         kGr7DlP28H1mJZkL7fn/bv9zfmoCL1v3/yk/PZdLYDIx8Uwpwe31Vt+cCrzqVPL3kHTo
         9gHuCts2JImtU/MU1tn+RdghNc1ZY0f/NkVUqT5e1wCU1Pk8fP2iB49FC8ikWbpoYqQL
         VK8IsfpWPFZTLcMdeZ3OkhKQ/WPoqCT34UAJEjflSYDIrQtuL1vhCFd4d6y0MlTXXz6U
         s3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904411; x=1766509211;
        h=content-transfer-encoding:subject:cc:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TEEx8ZOIqVaaJXZbASzMWtZGBEUAD7Bnsz8r5TpuRUs=;
        b=I1BMQF3HvYJGoBW9YFty0Qol3xnP5veR053dZ7TEprn6DrauJsIIOzr2WfDlIAa3Kb
         6cHiKPLz0qjdsmuoX9q49eVLOw/TQV8n8i5QG/KePnQVHB7aXyh59EjO9CUYIld5H9y7
         hEFYCAUch0ViS18phv/1U1agL9TYuUT2t26B3FkMoeL3PiJbqV+c3s1kUTbq0w6uJghM
         lynuGTTbA+LSRx6R9VevBd+x63juYzXX+dKDq/vemp3NvQ9B2mQEXc7gm0hiLQQ4vDq7
         b6iJrSfii8uaantf26K18NCVxvjWQ85M79MUFR7AOkcR/CS9XSt4ZRfjk6nJ/kWH8fJ0
         6uCQ==
X-Gm-Message-State: AOJu0YxOHFWURXjRx1t3rXnGLFn/E61KxENAIC2K9Zr+RnQHx6Rev8MH
	2enRzR4Mexv1eIr8+I6282krvTYQQdRLi9opOPcBixt2AowYPDKY1bOUQGnTVWN35Wknc8hN9w+
	CDp81O4s61If0EkCzpQAaErzzsJ9+Isct0PgbpJEqmP9q+DL2Xc8GIvUyQd2rz5cEw6ueqcQ7
X-Gm-Gg: AY/fxX6lET7Ysfhm6qrABbfMkHJXI3mUMCj1ZRFQfd04oPSga2uHj7Jl+BDrIDtOyVr
	WurSxxqSWd9gNhWsku1IYo93CPjevr5I/ffX8pdRAmhnZTJ2WvFdLCGP86BWFh9u6sc5zVcpCao
	1I7nNHqz7ukyPO6Bs+W7mfGW/5vzeWxFfjkfzhdkWpGUR/pGpq3GrpY49B0wcpgWb0Dk2LD6Nnw
	uYQtF2PgJsWMieu8IbyqGk5zpO5im4sw6ch/5RCz5r3JXo+v5omE++1GGJC4l5IichrbShe9JiI
	dbRpb6vuxl3Opa0lKIuy05Y+YZH2SFH+LIaFgFqdjAec0ZXyK4R8uybbg7tBGqkrxcNm6zyIvMv
	4A19a5HJiLMfStjY8UR5UGLqRvrF9X/p3kh8ykQsAuCYzrgRjvxE1G+0jhpzGkb2GsrZLAw==
X-Received: by 2002:a05:701b:2201:b0:119:e569:f865 with SMTP id a92af1059eb24-11f34c15dd7mr6793740c88.2.1765904411254;
        Tue, 16 Dec 2025 09:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh807O9wiCy2hOIzivkGcucYDhCOzbGHBxBBe7cIzrKYGT9utY4trJEMwvJscRHXitqTUR/A==
X-Received: by 2002:a05:701b:2201:b0:119:e569:f865 with SMTP id a92af1059eb24-11f34c15dd7mr6793708c88.2.1765904410549;
        Tue, 16 Dec 2025 09:00:10 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm56584837c88.13.2025.12.16.09.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 09:00:10 -0800 (PST)
Message-ID: <b23501fa-d30b-4ad9-a88f-2c5431b399f1@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 09:00:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ath12k@lists.infradead.org
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>
Subject: Merge branch 'ath12k-ng' into ath-next
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5S7mEs6QQKAeATP7e6YZlH_sjqzwE0gY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0NSBTYWx0ZWRfX/A9MTxgX8Iq2
 DAvtturRQfd2Xz95P0Al7Dcc0seiCgb/Cv9RmWktmb/3To2OfMHd6vs2NJvxji52CaOdfRLJD3+
 Ug5yanCqiyfuUkBmVAp5CDBL5c19mTpLvYOZay/R0zsiAaZiLl3TBZtDPAIh+LYAFRgiz6+Jnwn
 zP9uzbycwvKP2ltOQZTy1brbayleOzQRwGyjrgTJWX72AkUqCOWdAwesxzsuYyI0kzZV25fxvuZ
 aozBbVEeBrslAw5SyzzS3/dLNviLmirAO6McKpPammQw7GvvZx88LrgVZ+LBybJCR8K5S7IqhYf
 9LEHCiJf2vSCCvxj6raCsusnd8WlS3f45greo+AIh1o4UF+GR13zPB+HHRZSo0m83Yt1Ngw6CNa
 YdoIY7iJr+kWugbSluTId5LHRwHBTA==
X-Authority-Analysis: v=2.4 cv=RKe+3oi+ c=1 sm=1 tr=0 ts=6941901c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=u2hKJCGcxp1EJyTXNiQA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 5S7mEs6QQKAeATP7e6YZlH_sjqzwE0gY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_090014_644002_65C75D15 
X-CRM114-Status: UNSURE (   7.40  )
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

As originally proposed in [1], the ath12k driver was re-architected in
the ath12k-ng branch to separate the logic specific to 802.11be (Wi-Fi
7) from the core logic. This separation will allow ath12k to also
support 802.11bn (Wi-Fi 8) in the future. Now merge this into ath-next.

Many thanks to everyone who worked on this re-architecture. Special
thanks to Vasanthakumar Thiagarajan and Baochen Qiang who reviewed
every patch, and to Ripan Deuri for the ath12k-ng => ath-next merge
conflict resolution.

Link: https://lore.kernel.org/all/4a17d730-ede8-463e-98d8-9b0291d0ca45@oss.qualcomm.com/ # [1]

Actual merge commit:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=ath-next&id=631ee338f04db713ba611883f28e94157ebb68e5

Note that as a result any pending ath12k patches may need to be rebased to
conform to the new architecture.

/jeff

