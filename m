Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2ACC9832A
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=; b=hKkgJ84PkeTJs1oWMsgg988OGD
	lMwV+Lz5o+b/r+6/i5AVNuGvIISENx1ncqrGzEDTeaVlFmbNaGNmq+OIeGAK2YSSg5zC9BWYEY0c3
	efcmPv8b3Zla9eymP1sEfk0h/2zvjl0/AXc2w5lJ0vSw6aGl6PRoSuWfVnz2zigmaNfzqtJwyFI7O
	+y7uUYVLltKYqPtND1TQgWkB4NVib63mQdH0K6mff8rMsV7EAHTw5zrVpD8yIGGd7kpv34f0hxBEh
	0yQJFNRrENSTFcOBgmDEHigN66pE2Gu/F1usLfa+jNKgyKLMV1pfP3X3Rzz9KAbGi+xBWVKk/QqLd
	fYUrgHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZHd-00000003rCP-35cb;
	Tue, 29 Sep 2026 14:58:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZHa-00000003rBK-3TZe
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 14:58:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeDh1016868
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 14:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y3FAXes+v/ckFLFxhg6vzm
	hXV+ldag2L1geEzXuvTko=; b=kC8tdC+O4jGkx7MBe1lGJU9fylEBoj41LNFXyy
	fFaCe7hCOkXfH8lEiLtdR08HY8xOWhAxPrNoHXhe2gTuVahIsgEXj+X1jAoli5in
	Ed/UNz66CtpcwYUNbDpyJz7syVqHlELEB+EYrGkoQABaVB1jbxaw2ZRuLdufCq2j
	jEKf5CpJi1YfyGFqFb3lT8SPp0EzLFm0FHnvECsP7Iisn9gnqTjD2i6Cnq3I0iJl
	00WH75mDgAGF2Ts/mnanwHPqxhaJFYOQVMRumX8iP+ZUM7zsVkJSBYeLHfm7Mja8
	0m/goyvW57TkwPiIyUQNNAJf4bvPGV+iKstdyXqX77GgEkzg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxjmsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 14:58:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso1642655eec.0
        for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790693893; x=1791298693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=;
        b=YTyuWve1aF2QzRfJipkzHzFxw/8Bd5QCIozVhgbxFgYIrGxQk0RWthbB52VRgFb/Mu
         4EF093J9xJtSIizBdL+6QxqlWp2yHlmMyguGaeu0urjymdv9i0AWZZ4fMS6tk/bSvQ5e
         5+LqRBZ+kvasNtb7EMLbd+hzxoCL3aCW2YJPuT/hSEaNOg3Oj9QF3IdNAjmfNTvsa9SJ
         rLpXwDCuokAWKdvhmAm/KPKpc6Z/RvWtlWB1nvFCf7WAosTI+BrQtG0hus37VQunG9k8
         Na6Ys1W6MrkOLgTt33/Dmhnqw+KxT1tkRSpfmXsCNMSnqq5sIa7POsHHNnHgy+0XSPrh
         G78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693893; x=1791298693;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=;
        b=cP6PFFqA+NAXdcMmi6w3ALirVtzWlw0j7+Tc2zQpZ5FXRz8LbJR+4w1cVO3ha4TZ3C
         rF/v4OhCO0CHZJZPY/ozIck7qn+GPtnFiivUvyT6L54fu3dxru04zIID8ugNlFzb7XdP
         y7Ur7dsF27kXWvgQk81NAsRu23B0mbxlf4kgteAs52CwsUnJDZUQtpUhKn0pryDBdWEb
         ZP8XBM8I2gqqXzMHCG8ZIe+25FX8bm8TmzFLGW43ulLHqIyYI285klMIfQUWNRc6iKnl
         SqYzQ0T/E0lr/s/xVeUnQqTdyP3m/PVX/fSzUGdzEF0jjLeNIqHYlyLyjLGDwOppRPs3
         +JgA==
X-Forwarded-Encrypted: i=1; AKwUvBx9s2S5QB2pxxXg5vbOUtdVKivgVqOt6N3k87s3MtbBFy8FAAQTahrLzAw6BcQbTbHFuUrYl5E=@lists.infradead.org
X-Gm-Message-State: AFuF++mQOdyzsoyH9godwWJrZFi0pUVYxsU6bw5oUuAWHNbkdeOrbRsU
	bpHv5Yiy+WebQWAkDqr5dyaLhVo8tLORFzAVRQ3wpHojltx2taQ9DNVutKgi+OMfbDMTKK5sTlh
	sqFazt3ygBA8GTkCnbQG0Eng/Up58DlHW0m3XFtItRNegy24PKyv7TXEtpUT9cFT0
X-Gm-Gg: AYBFou0bZu/6THLd0E5Zn1BeLT9dXMwkSwlgU0V9lt7VzthZsmIurrsq5Ok1904m3r/
	/OPr7k/laNuCkV9v4A1kKSlMUAFCWdTrrzakx7duNeA2k7L6P51hQe8yPweRC2rc9M88a3/CCaE
	Wyrdqqn7dFHBdBbVjWP4Psd6+/mOICtod+oxNp3gnkqMs6wlVBJEMK/ZTIhD8x4isIBfhjSUlQk
	bOI3l2ae8tEXGT6X78Yhxt3FSHR0Hfs2BQwgm9SstB5qFojztrOJTJrEw3BbvF7/MI9xZRI2MeF
	c1MMR1ftIin6FQjltDZ2reLh74PbM0NxQZiyiY2BWftSb07vEkOen2eKJxB618p+u4mttG9pvVL
	TZkBxojAplhyhDvGPv55H+HmwjSni3+kW+b0=
X-Received: by 2002:a05:7022:7f19:b0:143:342a:3d3d with SMTP id a92af1059eb24-14c18a55c48mr1297370c88.0.1790693892532;
        Tue, 29 Sep 2026 07:58:12 -0700 (PDT)
X-Received: by 2002:a05:7022:7f19:b0:143:342a:3d3d with SMTP id a92af1059eb24-14c18a55c48mr1297330c88.0.1790693891851;
        Tue, 29 Sep 2026 07:58:11 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c60c55ed9sm163937c88.2.2026.09.29.07.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:58:11 -0700 (PDT)
Message-ID: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260929
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX0s1bE9GQ8XRI
 4T7pI0qPCojOl+8zHnQe6+M1q+WF957JG2sHUk9MOSj+I+g9KLp8IsZfTGXAZ8RmMdPj32yYzUM
 8elEZtA8iBLmM+KZhgMDoKzDAxjH16w=
X-Proofpoint-GUID: y_U29JBGh50s3pkuq-jtnOczDrq_xQsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX/WzF8IChgPsS
 WiFE6Q6T3spxD4JznKE9XZsFLQ8uKcrGa1JCNGY+4DJGHopZJSajnSZHz+DxlgMMyqlpTef06to
 4jGKDJCFRC1eisIsD+uh26AJsIkgIJCvalsdNYJf3ikZ57aVYY4K4IhZJVpmVQg0hXykXkQyuQG
 Gzjdq7e4kMDQStL/tbaO1Pii0NevjKYfTvgHi4Tqq/1HqqpaYUmidewPxZDtE5iOqU3NEJWyY8p
 HM4WAB/iDMi+99HMWAuerhm9x8AY5SK7tRM8bXwadDq58YsS70n2i6Hgap01VYwScd1MgaND+gW
 +ZJ3jpLG/wgzptfPa4VhJaWgVVY/pnwPBi3fpBVpvANaktHPB53thl2xKybsMjFpeNL6WZtQMv3
 3s4ZdlzdSB1d+cHuEP8P4I2KkGI2oUilAj0SszJei8tYCeaTCg3hfgyQQQfMirwfzSCECWWd51J
 lyl6CTxf7VuvTK+VeiA==
X-Proofpoint-ORIG-GUID: y_U29JBGh50s3pkuq-jtnOczDrq_xQsY
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbd205 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=zv2FTJzYVlaOH1Dba7MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_075814_979397_29E6FF13 
X-CRM114-Status: UNSURE (   7.18  )
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

The following changes since commit 6f63e919fe1e335b8abcb3a28bfd4804a98d875a:

  wifi: mac80211: fix slab-out-of-bounds read in ieee80211_monitor_select_queue() (2026-09-28 11:11:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260929

for you to fetch changes up to d52302171b61dbba6c9c15e80e9a5f02f1e9f95c:

  wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume (2026-09-29 07:03:58 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc6

In ath11k, fix an IRQ imbalance during suspend/resume.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume

 drivers/net/wireless/ath/ath11k/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

