Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5868C79FB6
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H71H+XVmzymD4EyDuwymxNabVhGvupGLJtZG1omyyrM=; b=c8AwDvQMBomYBGE20LkHlmh4l7
	1t4U8mGQeDu7NHQyi4E4NFrRdYhpYC8eIxr6F5O3+MxJsg+RkhWTNBxDPO7JaSTvuFkLCiS2HkH/D
	xyekiIUelCHJZVe3R0SG6T85eAFT/dZe1l/pyo8B08alPO+2StoZ06Im/SwD0w5d4XwRM7UB09znG
	7Vl44v64cm/TXq75/DjeLI4QN9oQFWnqptInbV//H2iz6mKZ8x+q0JiiU0v23G55LmwqVYJm7Q7WR
	s8w406bWlpw6Si9ineEz4vhproce9rZzSBWKsy+B7Qx+QEzAV7Ze+4PiEjkOYagwKhuJnhWdOh5GF
	7Z8dBNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYO-0000000CYM9-2N7m;
	Wed, 09 Sep 2026 17:57:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYM-0000000CYL4-2KoD
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 17:57:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7Ji23412821
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H71H+XVmzymD4EyDuwymxNabVhGvupGLJtZG1omyyrM=; b=ONFq13vz3JlQZIjT
	ilRqOVr831QVhWXAkb4wmm+0ue1jfvII0nUjOYbXUEryu0tOrSuAb2AndctpWPnK
	LpDDk77ENGceGwZUPxHloOLXmsjk1LyxWYpM4pi6pSVBKpiAxYhbvLjiJFXJNvlP
	YrcsgcaDluH6S9W+xnUEhGB93NSMmeREXSn6cYU19/M55LYQjijGr4S66kr/x1n6
	e5o0ovWoRo6wkG1PO9kul3c36y21334wMTRZfh9hTMTxWKuns7awEO85LzJFC8TD
	HuYKP6fClpDt5n4YArI96ODY1Fw2VtjUYgE6Vn7Lw26NQnKHOTQRwm2lgev6bsrx
	GiMhmg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh1rdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so7830223a91.1
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976665; x=1789581465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H71H+XVmzymD4EyDuwymxNabVhGvupGLJtZG1omyyrM=;
        b=AypjOCgohtUO4s9KiY5Go3b6RuufmwWSvCEvgO/P60NfaqSAClkG+5p7q+rwr1QFnv
         sTiM+/PPPcxBCSRMy4mYwJ5OCe56CJ7LpinL0rl6xknGp6Za5XdCYjobhmXwmwQ3/RUR
         jyEjhp1iVatzIbIYXOaftTc6ZAyaa6AgO7ev+dVeQQ0lRw3f0qSx85oT0L/z39UCKLNR
         cgq1PjFxJRxkoHC6dwGzBbPRXR2tUBQIm41vZdfQsmzRWAxyru1Kj/WlpSuZDelqsKhR
         c/8LIyzIlLan/7gIT28Swcfm3jhGTuZbRqyEfrQJyuIa+gozSm3jCCnIqfgaEIVwzs1Y
         ktEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976665; x=1789581465;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H71H+XVmzymD4EyDuwymxNabVhGvupGLJtZG1omyyrM=;
        b=Lt9ZvHW1a5C7g84y4hlDwwVrM1K8B7JjvV04snetCvI48eqfLEXMRDyFE1CgZQ5n7U
         L9fpmA3MR+KOC8f2geoVGKswiyZ8M6mWQblhFnnAG1PHrY2vO7woKnyzubkoRiAU4WBx
         ZdDxyIq/eBg4mbhO8F/qtmxI4jQNgQB1PcDrwd9hf83kkAeNvGhgAkzSupM8RAdTfF07
         bRzTMkIPgoTXJM99PdaPu4u2Lq8rMe+1dmE836J0KeUqgffqydGp6gqnz6doMm7POw01
         C8xnWvvaQgwy9Y9y09Lz/W8hkPFBMuSbmzQRF7IgKgvaZnYBO+8JHTZ1n8d6KxVvKhfJ
         lFcA==
X-Forwarded-Encrypted: i=1; AKwUvBwG3JWJS/dUQn6mUBX0jJY5gRnIG2V73MYBSuUIQEOAYx8BjyHzlZeQOTIqOCDrn2AWfVDAKTQ=@lists.infradead.org
X-Gm-Message-State: AFuF++lQrNGrjaydq7nDMag54zdakjPYEUVCjov5EBnzZLKSnsZAjsTU
	qaURZ096Zq6GNZhY3vDBWKzKLhUlirRRms9i/gQhd1NnVo5FT65GMaMmL2IwxmRy45ZGeUlKxa3
	2OW+/gk2EJ3lkwcGMWYccR+pa4pX7HebNX7Lnida9JTNbBhG2XRmtnSqvfraMdzaL+n6B/nm7
X-Gm-Gg: AYBFou0RCOGRGaHJiH0etNSqhx00twsVeRu/id8LVHyus42nyAg0yMKxKNya/y00zkp
	xlvUkZzpZVqyBuzdu1UtMmq9eMKGHT0yHznh3PRUXYKGuXrhJ8khWXg+rXIxn9UWruQOiut5pyA
	LwuqkwDZIunmbl5EZPUM7Kzs71ULr6QKDklJLVigQaukx7es1SO+JHzo6VPrcTGGlInMW2X9xJU
	6kohymHqPXFPTBkd1xZuZtu93/JClIAR8yHzK3T0z5f1OMYggsSSYG32MRDkR8dkt2g7w9cAEk4
	o8j/nTC+KjeSdHZj1216lHCx6qUQX4ToksNJeSe+cz3p0/corw7nAQGiIYpArRpcI5ShJ3lWf5A
	buiZ0sEiZlMd2PLFL1dL7epXKf0/sD48zLSAOOrEmlVcXv+S5wOdyCl0=
X-Received: by 2002:a17:90b:560e:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39b261e7931mr56241868a91.14.1788976665419;
        Wed, 09 Sep 2026 10:57:45 -0700 (PDT)
X-Received: by 2002:a17:90b:560e:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39b261e7931mr56241776a91.14.1788976664895;
        Wed, 09 Sep 2026 10:57:44 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260819-ath12k-cleanup-userspace-types-v1-1-161a1e8910f5@oss.qualcomm.com>
References: <20260819-ath12k-cleanup-userspace-types-v1-1-161a1e8910f5@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: use kernel types instead of
 userspace stdint types
Message-Id: <178897666372.2048605.5251378053771622917.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX9zS6J9aOkaU5
 YT+Z97bzLl/aYCmHhTtXUlhqk0ODiIIUPRpMxfZV7kYEsXMnqJgSW2fNQClkv2loOwMVl5CeJU+
 6XKwT8lheq+uAYeqn0O1/72tVqSbvQWtcL137tXMlDy+xWFJi9PtsN0i1VYBGWVUz1JbjaLUWXl
 TD+r50PhhcJ4giXBfzmbMpxNmFMhP2DjYQouKTv7W7Ohp/N1mtcqRYKjtTfxeUQtTZpBcAJjCY9
 P+upW3ZWRpNv012bAS9S5zkaGB3MYhQqcoaTfAa/4H3hnp1wZiR7ONUqGWgFdV5SbWDcWtgJ2Hj
 GAe3rMOCvjinh1ze+ssW28OJuLGIMxofaLhjw7QFGbRmcD6DO2aJn9u5gMIJNijuc0IQ2fTV+5H
 2aWiDDUHF+oSqSvemj6ysUKaYT+rgJKk8ZBu3W/gs/ChGq1wYPDjkiECqMdnpg+r0X9dMW6j8ba
 rFz6jFMrw8y8aJV3Apg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX++jEW6WPSTpc
 XG9//iKmxogS8V5YFg3gaqZNYXW6cQMq3gwzuhj4fHcel8b9214tczL4C0A9iDs631JP0CFtAH2
 Hr9WY2B653tAd0g/AUew+o4YSNeEOeQ=
X-Proofpoint-GUID: 9hMB7hAXil9Je_5iGrCAJKwbYqaZMHF9
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa19e1a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S76r9hedyb03ojg00oMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9hMB7hAXil9Je_5iGrCAJKwbYqaZMHF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105746_611377_53160656 
X-CRM114-Status: UNSURE (   8.90  )
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


On Wed, 19 Aug 2026 09:43:16 +0800, Baochen Qiang wrote:
> Replace the userspace stdint types uint64_t/uint8_t with the kernel
> types u64/u8 to conform to the surrounding ath12k code, which uses the
> kernel types everywhere else.
> 
> No functional changes, compile tested only.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: use kernel types instead of userspace stdint types
      commit: 958287de1c1e373e634a5751d74e94bb0ad94ad1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


