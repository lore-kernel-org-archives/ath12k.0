Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A26FD9E14
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 21:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mM98ISQinZlQlT8uNtOxm+PjSrQsWKHt7t2eBAOLhE=; b=JuOiiBtKlfGLDPeQfR3yALJjJG
	szG+B7Mgdk5Xsi5IE5uKACF+zWoPqVZYt6LTcj2o40zYVewtTYds57Nkh691STz/BotpEJyUt1EWA
	XMaR0jutPnaOOkcbPVOWW3BNYGznJnnkQnu6mO/xIKIoBoBgSARUzQcdzTnjmIG6kHO5vp6L+th8i
	Wn6H0n/Zb5Gn5mzYGsrwEPpOpLYxzIw4D57Vc9WJgZxh08T0pADz7AgoNsDCaPg/YN6D9KNVmnlI3
	WgtUEbIlsEh83q4HnUcTrhVH/9ZMeiWMXWhhH61qFFA5t/DGKO6fAMtLXrXTBq6qBhbvf2eH6MsuI
	gUTd2TQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviv9-00000007FO9-041q;
	Thu, 26 Feb 2026 21:29:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviv5-00000007FMk-0vfl
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 21:29:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEeAk1825573
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 21:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mM98ISQinZlQlT8uNtOxm+PjSrQsWKHt7t2eBAOLhE=; b=hOl2TUiTHPbSNGog
	YtujDBcgKQkiyscrjC5RGaU6yztHw56zhDwd0tCgqQ5t3+F7MSlooTae8IqKl53i
	/15jfPrjKXIfTz0e2Ezp25WjfGbBhGSpa44hTU8OjIpl+uwVa31jS0005ZQEvwpE
	JjSQRsv97IC5nEezL7uOvG1QSDcrTYIlTznNUo36OdgVfKuCYiSL0kxwnZLghgvC
	01Eh7X/VrIyWtuPXTkZBGhzM5E9NNTP7ATqY6/VVdlsys4p4QBVIh1QmG027x2UZ
	ACJlY9rPyWd670/5wq/KRThiR8Xc5X5luRmaBRpUAUL6XL6duaur288ZRI+OT9Qh
	XulYdA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v2np0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 21:29:14 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d475e17bd3so29724686a34.1
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 13:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772141354; x=1772746154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mM98ISQinZlQlT8uNtOxm+PjSrQsWKHt7t2eBAOLhE=;
        b=btGPdDgNZtUp7HiWwYuJzD4IaY+NzIGEm907U4EkZI90tstFFP2hyTfWiNe6mw6BSQ
         L9PRExcAeBClcnQ7mJTxA9KY7ifgyfv3NwCPB7Q80IgrhxBpI/Mt7ydHglIAR/0D8Y81
         pjHu+fEjUUEtlKUCzXEztoQNg9kClYBgkwvpLvBX0F2p1vD7imeZl9zVVnkFbPCvMbTc
         6sq50pKsX5C54D2AQxkgzWLe+0CpVozLSs+yNUauronG94l8hIDa0DMCTMGLyycUVqrL
         +zgKmVNp2tmMqezLuTHVlS3mqe/l2FZbBtALxBND+K2X00Si6846B+vokIB5evcBy8s2
         1vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141354; x=1772746154;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3mM98ISQinZlQlT8uNtOxm+PjSrQsWKHt7t2eBAOLhE=;
        b=dHFDSMuauc5t+iddLT/rg2NOE2oYv/0OgWR0ZzSmVjMCIhACL4OikmGauQExrsz/yM
         LBUCdgloFvb3S+YTbQJm3LVhd+3q9MZ2fVi9oSNHOQatJt+LArwvyqp7PQjz73dwGcDM
         hhQYqTjwTv1gajQo5wgCwqKMJ3jGYbbCBbPwH9mKc9Zd8GENuvqWzVqoDA8ohDWRAQek
         zMba4ggmQ6tj8RIfObxA85XVQWuRI+yWv0hppeMj2uGpfrZxP4erWHDLIpGTAMWXNj3E
         QR+yO5FbONAoMDOhjKdxrhZmnueVy7wNZQSE2aAkbBJwDKmOvLT24TWjsT4R+Ea0xKjZ
         f8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQNgXA1XqrtCj1nyCfNDqzS3bQd0CzasZLvG/pXGsltA7C2NhsnE04vCk8znKN7gE1WC2C8qY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeuuwGoygkQkkBO91CyZjHxaI0GZXvUDItw6d4cm4O2i+pSH3k
	RekhD1u5KNBIP9/sEQRPyMO6hKmfcwwg/fsrZqDxtLiEG5164QutySlwtSfMCgJg79OHihcvjUI
	sbgt53Ovmok6h+DDw2WeMQX/STDbMXA9cv9Yp8FE+RADv4uqN3NzkOUIngZuhdfXW
X-Gm-Gg: ATEYQzyGLXcpt+iIRag4iRYvVwxiRZAyABObGz/pQuslBe3j0wGuCBlnaCwN/8P6mqX
	010YyTIHsZ/c772IqiXOYgQcmowZ/wzz8HYKQufkOWtWLGwfkguzHekamdczlNd/Rd7O62CYYZG
	J5OI2gZY5kRvUfGloAgxs6eHkFoSriIyRanD6tiHH8TAvcUK3OnBTuagtLHtV+u/tEzsvH3XEvQ
	QR/i2KR2fAXKMhGmcdvuJQl/0EfYxTi1Kqs5g3gznxXYdkVEWJ7gvY1vbun1HfXheo9x8uWm6n8
	oMPshURb3cmRO59BauvXMYr66wd3S+jIRpkpUEevCXfVcYTfqpdiKGNJ6pbwBpZsYdjpNmZmG5q
	e3/vPryeA3ZRczh7wGJzvFAUoQFLd+9zqlpSE+RiXlMgMJkpfAJy1JLZRCqp9pwpsGc+7FK7+Sm
	ZA
X-Received: by 2002:a05:6830:44a1:b0:7d1:9574:db9a with SMTP id 46e09a7af769-7d591eb98aamr374846a34.12.1772141353908;
        Thu, 26 Feb 2026 13:29:13 -0800 (PST)
X-Received: by 2002:a05:6830:44a1:b0:7d1:9574:db9a with SMTP id 46e09a7af769-7d591eb98aamr374831a34.12.1772141353327;
        Thu, 26 Feb 2026 13:29:13 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58666ed17sm2866703a34.27.2026.02.26.13.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 13:29:12 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20260209-ath12k-fix-indention-v1-1-6b87ae99745e@oss.qualcomm.com>
References: <20260209-ath12k-fix-indention-v1-1-6b87ae99745e@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix indentation in
 ath12k_qmi_aux_uc_load()
Message-Id: <177214135217.1298720.4558552166539751688.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 13:29:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 9_fpHYsS97hz_aC3_xIK_si6YbGUC10x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE5NiBTYWx0ZWRfX4+hvas6wU59E
 Qdcc1pn1EGVkojPf6PPicRJPxmcNZzGR9rZtJ4CRd83bhGhR35FHzeh/hIMDEbt/7kUaMZVIu2W
 j0RhinS0ioAqFBmw7qkV2kL2Hvjg0ks6rTxEl6QwZV1vjJ3USll9XcX+spYiujGuZUlI9q+sP0k
 dU3Yh0ACpwkqQLCnfoZpoRs8QT7TX9R7AJ3NyjND/+fhNmiVtozDw+sLoTNCFApqkiWrE6BSacA
 fgKJPGFise7zJ4ZDeP1lGYXNN1Hl7vr7Op0fvl7m8dC6YCyDekP7jrxNQ5q7UGCTF2S72YJqAYZ
 EWdf+jCwkHhVVsXg1XNP3GZy0N7zaydCiCfnnv0P1ta0HAyE1CDFCZhriEUNm4R+IQeZNHWBvYr
 4nvr+XikKRlsRuh7zjQIvP2KWG68dz4KvzVbjqyJi27QpAwjtZYe6d8xUd9jGTD2JgNhf6mMZ7e
 t9/YM8qjhAYk+4+/5WQ==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a0bb2a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=i2l99LBLotoStgmZAKAA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: 9_fpHYsS97hz_aC3_xIK_si6YbGUC10x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_132915_270312_193AEC3C 
X-CRM114-Status: UNSURE (   7.95  )
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


On Mon, 09 Feb 2026 10:52:19 +0800, Baochen Qiang wrote:
> Smatch complains:
> 
> drivers/net/wireless/ath/ath12k/qmi.c:3342 ath12k_qmi_aux_uc_load() warn: inconsistent indenting
> 
> Fix it.
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix indentation in ath12k_qmi_aux_uc_load()
      commit: 0ef4738f0d38f103e525ffb12c112a935c2cf011

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


