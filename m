Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED490C79FBD
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 17:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AJdDXnIcC3t+ZLAD31bDqg6mlpTdQVsA4WJa0ECEew=; b=TXu/zYeEUf+5ZJGqQYr7KtHCfR
	pqTP31P7aZLbQNwDWrcdIRRQMTv6p/kMgyMiOYjWo4YxEVq/ytVQLgvSnfDpeQfRRCPCuwRzZ04TI
	1x3Jzk9iZXX+EBGxhUg4PjJbSvB1cbA+hG2iIjgMJfloVovbdR/tTZp9BOeCvfGPCGTU0hVu6a/Nd
	5yyzwdmLRgcDhqc3PQilnBG1pr+9JQwIPbY54c25pdRcHcotW1usu/2jMNMjnAsY1Wy4XARY9SHX2
	4DmhzKCUMQVwQeBJwijG5RcHzASUjC1kjFlTDBrN+7VJsWT1J1/FVwDFdiTVQT2gEXGbxyabwy8mM
	/mQOXPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYT-0000000CYPp-2l9q;
	Wed, 09 Sep 2026 17:57:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYQ-0000000CYNf-3AWp
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 17:57:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7Ji43412821
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AJdDXnIcC3t+ZLAD31bDqg6mlpTdQVsA4WJa0ECEew=; b=BWULOAriVHqVQG8n
	tV2cQ0wZ+HSihGKuJn9vhQZRABaQEWNzICia/Vfch/tI4MvpsHuhvj4UQ6KRVXEl
	dLFdboNh+xfAS4+Hn7bHaIQROZCcPFIrIgu+hJVCh1DXAbScSyMrN7e70FTq+DZ1
	ibxn2BK8vHr4cKCeBeHSlM3rjvewNNqah1tSNUtM5Y9biGcWM/wqT4a9Hu88gM43
	kXKORUuBFEt5NX3cJKSEq0det+ZujLLOaoXzhUu9a0QIp6fGFYC9BeqRktNDS6aa
	wvcGBNcrjKQzqavGNUB+Pw3cBt/JhsVoPDwBZ4KDZOByEKCQyKqPlIme0WcRuMtN
	lMLRkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh1re7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d292eac1so12269029a91.1
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976670; x=1789581470; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AJdDXnIcC3t+ZLAD31bDqg6mlpTdQVsA4WJa0ECEew=;
        b=b1x1sLakLnjFG8s7wpqvwKrRB/wlApbRFK710IFFWcVoMftWvnWK0lbfPpYhVIZrxN
         GG6LOs5Th70E22zN5nJuQW7GyyHN51ZNwoJyZM4djn++Qj62W1O7m5jVlEKvD8IGU56I
         /LXDL1z8I1o8x8d6TOPrRTGO8iI61HCclwmFCGq5tz005Bek0c1Ejo3TRg+xSVtTZWCY
         ckj7kE/w8U8XHDjfOV6hQ0RJlbfBQ8BMqA+zlQrq+4PkZt+eb3FDM4ZTuQtho8IHSLBF
         DxnUXfp5v4E9jRJuyqeZDXtTeuQZbCvJ2Ga6TvBJajTrTOgfAF9QW5ERaVWixLhseyMf
         sA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976670; x=1789581470;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AJdDXnIcC3t+ZLAD31bDqg6mlpTdQVsA4WJa0ECEew=;
        b=SwEam676QpZLZ+MWG5nE/vqSbO6Gv7XYpKBGwa3PlxO5jPWMAdzN/vXnUsSzi9E1VI
         gW9pLk0LkunPyqA0mWBhSNhKyTgOFEQUJDYLdWkoBmqiP70FBAfhd1EWk8VPKA0LIpJc
         NFdjaR6Au/6uODw0QFU+J0wevipeCAp/DfGWfaXnbb6rJ1dvx00hRgAEYfWg/dcZ1zUL
         y5Vvtnf50QDWoKAm5N5vBy1VmFo6sTgLgKkkuSY8e70lxZJkh6dkSVSRP8o0Yw82T3Bi
         iAKdgQKmEfvMyaDOEp1SmvtGh9rjtzlblCcPfzotmZBTiBLmTnpx2akyHMlrPSE3cJAu
         BMJw==
X-Forwarded-Encrypted: i=1; AKwUvBxfANULyajn8l8V+2v0TG3q2iwBhm5m8+Al+PlmOdydj7Kk+DMcgsXioh4LL3mhJm1QeiFivPY=@lists.infradead.org
X-Gm-Message-State: AFuF++kJrTKHeIiWwMYYH/nI/zrvdfAyvTz5lo6FysIEYchs5TUojSwi
	42mzn6IXSyreelmWZ0qoEKyDZ9+ess0cm9dOv3t1c79AE/c2s9b1zP0UWFygSOez3nKFHcQ/152
	rjjwo0W/gX1IpvPjepYLoLrw5Eio5GFWDZuSoLvZV/qW59/pRcu9IhLZzoVijDQxJ
X-Gm-Gg: AYBFou11xocOVxzQhceHuM9f/aNjy00alGGT5/46ai2Og2HMXs7v8ncDw5SfFEbf6U/
	ZjX5oPVL1SACZg+ShkD/TiI0aQeXBcsTINzTaXj6e61zELzvwS1syd8a0q7RrDzCbR/a41VKXlo
	dJIcUK6LBlwnVZKELqnVuUu/Uw4+lgYfoKvXdY/6nXS41ONbI7NtOe4ckRjMpQ5XKG+bLRVPtao
	9Qc33kMbXZhxaEve5c8k93LQTZuOASp4vU9M2JtjD1QMzx/vRZLoG2QU+1W4zNsg2cyGkhcOiik
	L6J7pR9zHGGCwUje1Tbb+bbCUfNKiG9AfH6MDbT2w3nJu2+zL9ejxspCvlHLZVPiDmjMNUwJYhU
	i0Ommeu3Hej0zDfW7YaAvpNj/W5YKnerYRzKlWCvMIVrRvBti6eHidqA=
X-Received: by 2002:a17:90b:2e86:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39bac3b0c7emr10982900a91.17.1788976669522;
        Wed, 09 Sep 2026 10:57:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2e86:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39bac3b0c7emr10982822a91.17.1788976668916;
        Wed, 09 Sep 2026 10:57:48 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Linkai Gong <gonglinkai@kylinos.cn>
Cc: vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com, baochen.qiang@oss.qualcomm.com,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260811020523.387433-1-gonglinkai@kylinos.cn>
References: <20260811020523.387433-1-gonglinkai@kylinos.cn>
Subject: Re: [PATCH v2] wifi: ath12k: clear dangling channel pointers on
 error paths
Message-Id: <178897666508.2048605.17545031957726182083.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfXyLo1VxxuXIf2
 pDoCvCdWizXiJ4i1wayUbPQKUGokRPVS1c9bId+Gv3zCrayyZs9fNXdj0l/RUP4jL8rDfIact2b
 Lu1H2Hq+PQWN0UfXEoNP9zCxZ4OrgcWLFZbGM8IG1QmTu7YI3ZniVt0xnNpTHVweG2E1M2qcPuJ
 gFNbUaZo7zB4VqrqvCkJlYiPmFQPau7Pw8kPXaV0wERrpDRDYZvFwdJBsLClSEHsjZQU+rbmqqb
 sjOttprtMX1x40IZpM+zgB3twsv47ux1ord76yhlLA6lxPrY4X7jE4giLT/kqKwC3kK8ZpwGjNv
 6zxudwt8Kcbsqhih6vUSKRghSy4n4tvw87w2+rdDzhIatm0UG95zrixerzbIa14wFzxWEAk/G21
 KYHDl/YAiSHHl+og1+emhJBPuo/UP3axF8JWX6nuogNEnnzRhwQxAHqgYOmwKmr/BJY8RRP7um3
 CfMRNxDx6RECiM4lQWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX/1Q9KyIz2u2e
 IXn/ujoOOg4xTetQav94lFnu0urzSQ1pStB9T+Xskw1GSh22ex50834uHbC9wJnIx2vA/OF1YtT
 2lM5VBemR3XpA2R5rSwfDWfoQUBJE+s=
X-Proofpoint-GUID: TjtG3FInEBo6wjSZDPQhIAcBCTB5rclL
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa19e1e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CpnD9HFvDKrr3bQfTTUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: TjtG3FInEBo6wjSZDPQhIAcBCTB5rclL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105751_854181_7B8368B0 
X-CRM114-Status: UNSURE (   8.40  )
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


On Tue, 11 Aug 2026 10:05:23 +0800, Linkai Gong wrote:
> On failure, ath12k_mac_setup_channels_rates() frees band channel
> arrays but leaves the pointers set, or clears the wrong band after a
> copy-paste typo (6 GHz free paired with a 2 GHz NULL). Clear the
> matching sbands[].channels pointer after each kfree().
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: clear dangling channel pointers on error paths
      commit: 507478f6f93864978a399173d4f54c8a987c8235

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


