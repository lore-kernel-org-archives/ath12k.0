Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8866FCA5FA5
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 02:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UFhWeC8nK54inRKs6I+y3KfLb6ie98THlXPGgVHMi+o=; b=x9gRjkMaCZlccv7mcNCi4oom1P
	3HFh/MP4v34B9d9gbvNPSHn+ilJxAxMLnE1bXKeyWlC/ga3Jmy9fXYY5wu03zOhi8lMv3QZyofAo4
	gQ4ciUZhZhUsH45CDnOkm4+VPUoRbR9Vzi74pt5/WHstBFhg6A74ZAej2AYiMEi1MnDmCdMQu/bUr
	pBIxU3YFcpUrv/VVUzh8qUxETNcsJPXBIyDDYfXZpgYX4A89R21P55rJMgfymKU8EA4LJeBFkEJoS
	pzGvn7z7GXr6m5u7VH4oCs6skEvYVdKqtsxUvbvcLulAFG8hOlGDFNhYtuGFGz4CT+moe85JcoiJg
	XJyL9wNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBO3e-00000002A5d-0Be0;
	Tue, 29 Sep 2026 02:59:06 +0000
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBO3b-00000002A4f-1vww
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 02:59:04 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-3468ec309afso1310319eec.3
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 19:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790650742; x=1791255542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UFhWeC8nK54inRKs6I+y3KfLb6ie98THlXPGgVHMi+o=;
        b=LRNleTmyIBFntZd3O8DuPNNxbo71fLWKKBUc1K2/5rF79eSXQufbcLuj31LV+MHRfF
         gokKQcGkXMhw+rx0t80FexldYQCuZ4ytc05OvqmZEicdsPk7c1RxZuJGP0bA7x9Rr9Tt
         c6HKlWHGnPnZyA39Of1gFe3NdVm185ZIZV1x3ZIOfL/AONKZP1lAJ816dXuPy2Ax4jyQ
         WUuXUAMgN5Ye4EamHVhvGQvABzL5M/wePz34VbJe0044gS0wd95AsTducF8uEYdzBKcW
         ikz0a3FtcYWr9ijqEYSIQxYNuBlrLYRx7vpKgHK+dvYN/LapBnryElwlyxNkZGms4vPm
         u3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790650742; x=1791255542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFhWeC8nK54inRKs6I+y3KfLb6ie98THlXPGgVHMi+o=;
        b=i1tIDSiCcOPqYlpB+q09W111HRe7tXCSwWdWke4m4xWRnAfq3ZMst1k0JGNp0UwOc6
         yjs8pL0Loud1LAzAivagLzgaLuq9W59VYFtYKis3qdwmi4Yo02Y7Z1jVm4hFmvXbtzLp
         LW4AAMPdoJW5cCC4xWQFnfC8PMmhM6ZUvXV5HMw6tdJZWOdMFQVE96i5sEgdakTnF5Cy
         8bvYh7Ve9Tiio7RzRUKeRIbbQ+40WBlLQVO5WfXLsogfS0TUemFqzol4L6wztmXcPrkK
         lYZf/H9LOtlMDl02WqVVse861fKw+PjDcxyVulEALNWmC++eixhk/rSBZwTaWOzANUOH
         HwCA==
X-Forwarded-Encrypted: i=1; AKwUvByAKxg+5ZFyVb7Kjtl4qcfSH+DAvTiJqmzWZMpYB7OBh8OId9kT8wc8Fhod3hZMdVBGZe+d9js=@lists.infradead.org
X-Gm-Message-State: AFuF++lSCjdHI4lvmipAgeoQrAuwv6Na8X/eecbxT+2K+5mtjnsoPJP0
	23nwdbGBSaNJEX3LQDGDpF+QvwxRKkux0a0KvC89XBymIEkVXgbFkYOPUjT8leYVcIuLTEuKLL+
	2yTGB7eY=
X-Gm-Gg: AYBFou2MhGfRR4zOpK53U0wvEf8tTNar/wxVrBsufygp3DlRHJLvwHpwil7u7zEs4VJ
	LoZ4cC4rXdR4aMpydnQ03yn4JiH4ukKoMPgeMyUb6s7ftAYYi73a3IQo/Jf86caxD08wY6C4f2T
	BLn9nWhOwb8RdL+VFUat7HjWK87bImQWgIpOCiMLfIvPX11FdOpqxG3a+bsVIBF2lrr4alLbU5F
	EVOBp3eYglw0EF95uZXO0KQtDL7OkovvpI1yqRvXWJ96VnrKb8FJwJDVE+qm2t/LKPJ+P4q6K4a
	VDGFNFPv0wzk2s7KMXSWuQGzwxJt59w3MnBwGajFLT/19IuEvuoupSAB8lff3cuYZ4elr78FlKG
	Vvy3cFOZc7Scejg48eD9j+8481/XGvIUcjsyti9WHY9IR+zFrYRBr9BE5Yxu+ntYPepr6c0id7W
	b7RCS8WtkY4C5Pi4TMe7wy51OSFFO48hJ7mrhAzN9365VvEBilILz2s4dsWLLWBLswI6UPRlrHW
	4Y6H/ElI3XFhvGIrEHTbTtQ6VkuF58p8Uz+bLrX8iGWpsFdybjo9sWjO+JXiIHSNx3NZd3maDRs
	Q5yG8Gw=
X-Received: by 2002:a05:7301:1f15:b0:33e:6bd8:8f1a with SMTP id 5a478bee46e88-3426cfdf68cmr15624231eec.0.1790650741745;
        Mon, 28 Sep 2026 19:59:01 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34571658054sm13111683eec.8.2026.09.28.19.59.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 19:59:01 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_jjohnson@quicinc.com
Subject: [PATCH 6.6.y 0/2] wifi: ath12k: backport CVE-2024-40979 fixes
Date: Mon, 28 Sep 2026 22:58:52 -0400
Message-ID: <20260929025856.85683-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_195903_514721_68099FEE 
X-CRM114-Status: UNSURE (   8.54  )
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

Hi Greg, Sasha, and wifi ath12k maintainers,

These patches are a backport for CVE-2024-40979 on 6.6.y.
The second patch depends on the first, so I kept the upstream ordering
instead of folding either change into the other.

Both patches are already present in 6.12.y, 6.18.y, and 7.2.y. Could you
please queue this series for 6.6.y?

AI assistance: An LLM helped identify, adapt, and validate these backports;
I reviewed the resulting code and validation evidence.

Thanks,
Artem

Series:
  1. wifi: ath12k: fix kernel crash during resume
  2. wifi: ath12k: check M3 buffer size as well whey trying to reuse it

