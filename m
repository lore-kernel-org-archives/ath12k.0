Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87E4FCC07E
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 21:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvMIy0dvO3HJeWXw/pV3WkTF3T5ZwMQ1VTTV7Em5SVk=; b=UfmDtn6zoB1szMv3RZfIyS4+SZ
	3FaP/Az2AhLlh/keoiMN0ciqe7nGgvbAE+qULQ4JpnbbeIV5s3rrZgA/XCNfw24ur0zCGwdTKUNMT
	QnI0UAxDu4sUUw5YL5WlYqkxUDgb8j/TBiRJbBXFijJz/G+UckCHTSPmVLMSc1IaOLft44srC7D7i
	DTZeBq3nHlCc7MFU+GtegsRWDmwnOzdflwWUgAHii4b+lWwuXE+u4krrm2vWak8d7dEv/3lNJEYmE
	Wb4lWl0Jli6MgNgCZRMNWT59TqHyYoqsEzRbd5nh/gblTnlwytSCOoAbtP8hK/U3g3ZhB5iMU/X45
	Sw3sL01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycZa-00000004WD5-1Mmg;
	Fri, 06 Mar 2026 21:19:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycZX-00000004WC1-3JzP
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 21:19:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWX1h692841
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 21:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YvMIy0dvO3HJeWXw/pV3WkTF3T5ZwMQ1VTTV7Em5SVk=; b=RYT0VOrVcKkIyORB
	slYQrdljV+LPg0SXdfZV7oOwEwrGfPAWc1c1G57QQrezo456GAKNfHFLWdYjzzY7
	Nkrc+Ar69ojWPe2lVVIjyG7MbgJL8dQXTAb59no8O6aYtxaVuemHoTiUj/JdOjcT
	oNQfcf5IF+2yuFq/vrEAqduVIp4nmKGYpTE4lb8FfMmfi+XpJ2711Up3tqvbyCMa
	LMxIL92jrTDXGQAoOzL+2vYOuBOUS6kbgjxEXGm22RWEHXc2KA01yK/EWZmhHubn
	n8MLlKiKOWGcowxLnTybXMTfBv2wbuLkKWuVolH4/7DLDUzji4g9AkXeesRMaWHe
	fss6iw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr5rd052r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 21:18:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be21f89332so4726790eec.0
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772831938; x=1773436738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvMIy0dvO3HJeWXw/pV3WkTF3T5ZwMQ1VTTV7Em5SVk=;
        b=Cxa4BQ2ycE3LNiQGdsZIv0jyY2LI1tDXI+OvEoPLiaJJd8zSED+PkRefsWSOPnn3dG
         Hf+UEm+fBoaitABCT1rIuPTZ5b8OvEmHJcnKeSJhvyLsBqtlQDCcP+dLhCnPoOI7bB6f
         kaMSjxxPh7PsJwzMOfnqfMRpvzRDOSuP0ezAkdbIon5NwSDWzU+HROAr7vm7oWhXgvUz
         dammwD4WRckRm8OyoeCDSMRI991525utpeUxaTZrTTkVnX6CpPVpsMFECvjvMoUK/TUk
         j/w96jqputOHMbKaGWboik5uCl4/2XUn0ZQw+iTiY2Yhsl/8xT7GB4zKSMZ0BHD+Z9fE
         qX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831938; x=1773436738;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YvMIy0dvO3HJeWXw/pV3WkTF3T5ZwMQ1VTTV7Em5SVk=;
        b=eH2UK2YYRs35LeBqvF9N1C8HMBFHz1EdSslAHuKOU/YUHaQTF4pNHfqU9kv4Ki3LCA
         K962WSWBt7rPGN5aKqvHhDvSBKJipT8niuron09ezEXYsoU8+kEdjeki5Oa8EvbirlTu
         KPxAHkofdD4yn3gSe5diB1scd9AMFb4W5OHor7b3hTyD4IvVtMMBPt78myT9bQmZuRLU
         IrsPnkZhGSWQLk0Mm7FaliuonjZG4QketOOeEeDX0ObAEOESsvffd5zZTeJVd/McLMOW
         mSzyK6b2K7COGQpAWScHZOMHlGttD1QnYFzn0ZJDOXyukw2GHqE2J6GwvpL/fxg3ZjPh
         zmlA==
X-Gm-Message-State: AOJu0YwEKkMfwiSk8WrHLC9OrF3czbccndXKa6p2nYAI3QS+Vb7tZRJn
	RB5sKsTbtClOMc1nw3/lQp3gAB6LkVGDqsbDXUY9pZ2YavaHT5A5vAgjJgPjjgZRBQhOSyfdn9d
	zlfVnrL8OGUbI8oTUo98oTN46nRKIHqploCPi1y56PFFTrrfBzXZJRXpjw6q72yQt
X-Gm-Gg: ATEYQzz3442itVvtMBCSDa7yXUcfUyjgjct5zITxnhfKIdbo0nh98cprY0DPASJvhf9
	xFFHecUFwqqNST4oIU69bWfM6Kfx/leJjM4FC6arQNgyMMbrzpMQp9Pa6Wgw+GqmbGYgx4DSv3W
	5xTSkgYiQ9rt2MtaWcxV1HwrADPDAPX9xKxrAhdaX7Zf7KHwbMx8MHUretmzde6IgxeHH1XcQ3v
	hA+wZVk8psXNw8u+3OXWevJltGbz+Ayw7weTyOhVdyoSvujxxsin0svAh78N+dn+thMoFNVq/RQ
	/GnWXwjxEXhg0TK3yCaXlq8dbp8DWYYeRgCnN0mN1lpy69i0Dt9gTJGHjdJ5tZi22s0/c6abzhI
	ET9jD0InWdQAW/rudek+kFpqKZ51GkBCqS7EBzUBgncgO0JvrCDGlXh0k3d5XE84OoOBnZVGum7
	sc
X-Received: by 2002:a05:7300:6c28:b0:2be:8da:321c with SMTP id 5a478bee46e88-2be4dfd08c8mr1229523eec.2.1772831937848;
        Fri, 06 Mar 2026 13:18:57 -0800 (PST)
X-Received: by 2002:a05:7300:6c28:b0:2be:8da:321c with SMTP id 5a478bee46e88-2be4dfd08c8mr1229510eec.2.1772831937259;
        Fri, 06 Mar 2026 13:18:57 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm2325124eec.17.2026.03.06.13.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 13:18:56 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20260209054924.2713072-1-thiraviyam.mariyappan@oss.qualcomm.com>
References: <20260209054924.2713072-1-thiraviyam.mariyappan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix legacy rate mapping for
 monitor mode capture
Message-Id: <177283193653.1373939.8377720073455537723.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:18:56 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: _i4qRgM4JsQSEZhyvqtVH5I0n9Nj6Q1o
X-Proofpoint-ORIG-GUID: _i4qRgM4JsQSEZhyvqtVH5I0n9Nj6Q1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE5OSBTYWx0ZWRfX6wO5PY00MEfh
 2r0FZZaAjnRgSETXTEBn//HLfO/PNj7rPmLVHTJ8Kp4LQ5q5Sfe7B/klP3nbHN6YsrS7CFos/oa
 n5WFVnOlGU9O/uEEMi3hVv5qETmCAibJmnxlQJEzrCsKoYti8JqAulFTtbRC1/8V2fbO+5Qt7/I
 fUkjf/7v8WlK6f9mLDDIdZFo9WFBMKITxxGI/nK92n6rDKkRsMM/MtOflnCOe/jPr64xDwrirbM
 gzPmX56INQTAw9fDKifbiFgT9C8iNpkaGFLCZCBEDIaxXGVT19RD+pjGI8obeE9L3QvQSNAGv2n
 S+TKaBlHKAmr+t4ILN4XXkDDupZXNTnBl16yYwx9yvX16FZKJ3717rUZH2kJyXxF9nEGZKtSgzO
 Vr5HyMI0/7vLRr0mHk1giTmWsuD2j0ZC+hkWrpaU12q+wpJR+jsIedLtaGWTRQFw37VjlOJvVPE
 r7gTT/R1C+8bHYZ+wNA==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=69ab44c2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=k7F-nlr3SNkpLXcf3wgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_131900_101759_C2BA285D 
X-CRM114-Status: UNSURE (   6.48  )
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


On Mon, 09 Feb 2026 11:19:24 +0530, Thiraviyam Mariyappan wrote:
> The current implementation incorrectly reports legacy CCK and OFDM rates
> in monitor mode radiotap headers. The rate field displays wrong values,
> for example showing 11 Mbps when the actual rate is 1 Mbps. This occurs
> because the HAL layer uses a unified enum for both CCK and OFDM rates
> without distinguishing between long/short preamble variants and proper
> rate mapping to hardware rate indices.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix legacy rate mapping for monitor mode capture
      commit: 616217a989e09c55398db8555e5ef0c64504cb66

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


